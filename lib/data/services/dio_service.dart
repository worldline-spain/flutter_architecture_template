import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

/// Abstraction of dio library for Api REST implementations
class DioRestService<V> {
  /// Use optional [_interceptors] to configure a interceptors list
  final List<Interceptor> _interceptors;

  /// Optional [_catchErrors] to get DioError. This is usuful when need
  /// transform a DioError to custom error.
  final V Function(DioException)? _catchErrors;

  /// Receive timeout in miliseconds
  ///
  /// By default `15` seconds
  final int _receiveTimeout;

  /// Connect timeout in miliseconds
  ///
  /// By default `15` seconds
  final int _connectTimeout;

  /// Send timeout in miliseconds
  ///
  /// By default `15` seconds
  final int _sendTimeout;

  /// Valid codes to requests
  /// If some code is outside this list, the request will be throw a DioError
  ///
  /// By default `[200]`
  final List<int> validCodes;

  /// Http request headers. The keys of initial headers will be converted to
  /// lowercase, for example 'Content-Type' will be converted to 'content-type'.

  /// The key of Header Map is case-insensitive,
  /// eg: content-type and Content-Type are regard as the same key.
  final Map<String, dynamic>? headers;

  late Dio _dio;

  DioRestService({
    List<Interceptor> interceptors = const [],
    V Function(DioException)? catchErrors,
    int receiveTimeout = 15000,
    int connectTimeout = 15000,
    int sendTimeout = 15000,
    this.validCodes = const [200],
    this.headers,
  })  : _sendTimeout = sendTimeout,
        _connectTimeout = connectTimeout,
        _receiveTimeout = receiveTimeout,
        _interceptors = interceptors,
        _catchErrors = catchErrors {
    _initClient();
  }

  void _initClient() {
    final Dio initDio = Dio(
      BaseOptions(
        receiveTimeout: Duration(milliseconds: _receiveTimeout),
        connectTimeout: Duration(milliseconds: _connectTimeout),
        sendTimeout: Duration(milliseconds: _sendTimeout),
        headers: headers,
        validateStatus: (int? code) => validCodes.contains(code),
      ),
    );

    if (_interceptors.isNotEmpty) {
      initDio.interceptors.addAll(_interceptors);
    }
    _dio = initDio;
  }

  Future<Either<V, T>> get<T>(
    Uri uri, {
    Map<String, dynamic>? headers,
  }) async {
    return _tryCatch(
      () async {
        final response = await _dio.getUri<T>(
          uri,
          options: Options(headers: headers),
        );
        return Future.value(response.data);
      },
    );
  }

  Future<Either<V, T>> post<T>(
    Uri uri, {
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    return _tryCatch(
      () async {
        final response = await _dio.postUri<T>(
          uri,
          data: data,
          options: Options(headers: headers),
        );
        return Future.value(response.data);
      },
    );
  }

  Future<Either<V, T>> _tryCatch<T>(Future<T> Function() function) async {
    try {
      final result = await function();
      return Right(result);
    } on DioException catch (e) {
      log('$runtimeType/DioError: ${e.error?.toString() ?? e.message}');
      if (_catchErrors == null) {
        rethrow;
      }
      return Left(_catchErrors!(e));
    } catch (e) {
      rethrow;
    }
  }
}
