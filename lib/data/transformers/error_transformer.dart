import 'package:dio/dio.dart';
import 'package:worldline_flutter/domain/models/errors.dart';

/// Convert dio errors to domain errors
MainError errorsHandler(DioException error) {
  final (String httpCode, String apiErrorMessage) = _apiRest(error.response);

  final int errorCode = (httpCode.isEmpty
          ? error.response?.statusCode
          : int.tryParse(httpCode)) ??
      0;
  switch (errorCode) {
    case 400:
      return BadRequestError(
        message: apiErrorMessage,
      );
    case 401:
      return UnauthError(
        message: apiErrorMessage,
      );
    case 403:
      return ForbiddenError(
        message: apiErrorMessage,
      );
    case 404:
      return NotFoundError(
        message: apiErrorMessage,
      );
    case 500:
    case 510:
      return ServerError(
        message: apiErrorMessage,
      );
    case 511:
      return ExpiredSessionError(
        message: apiErrorMessage,
      );
    default:
      return UnknownError();
  }
}

/// Convert api messages
(String, String) _apiRest(Response? response) {
  String apiErrorMessage = '';
  if (response != null) {
    final data = response.data;
    if (data is List) {
      apiErrorMessage = data.first.toString();
    }
    if (apiErrorMessage.isEmpty) {
      apiErrorMessage = response.statusMessage ?? '';
    }
  } else {
    apiErrorMessage = 'Empty or invalid response';
  }
  return ('500', apiErrorMessage);
}
