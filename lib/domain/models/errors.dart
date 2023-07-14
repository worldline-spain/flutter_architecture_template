sealed class MainError {}

class NoInternet extends MainError {}

class UnknownError extends MainError {}

sealed class ApiError extends MainError {
  final String message;

  ApiError({this.message = ''});
}

class BadRequestError extends ApiError {
  BadRequestError({super.message = ''});
}

class ForbiddenError extends ApiError {
  ForbiddenError({super.message = ''});
}

class NotFoundError extends ApiError {
  NotFoundError({super.message = ''});
}

class UnauthError extends ApiError {
  UnauthError({super.message = ''});
}

class ExpiredSessionError extends ApiError {
  ExpiredSessionError({super.message = ''});
}

class ServerError extends ApiError {
  ServerError({super.message = ''});
}
