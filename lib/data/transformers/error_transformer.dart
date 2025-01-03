import 'package:dio/dio.dart';
import 'package:worldline_flutter/domain/models/errors.dart';

/// Convert dio errors to domain errors
MainError errorsHandler(DioException error) {
  final (int errorCode, String apiErrorMessage) = _apiRest(error.response);

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
(int, String) _apiRest(Response? response) {
  String apiErrorMessage = '';
  final int errorCode = response?.statusCode ?? 500;
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
  return (errorCode, apiErrorMessage);
}
