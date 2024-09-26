import '../../../classes/status_request.dart';

class ApiErrors {
  final String message;
  final StatusRequest statusRequest;
  final int? statusCode;
  final bool isTokenError;
  ApiErrors({
    this.isTokenError = false,
    required this.message,
    required this.statusRequest,
    this.statusCode,
  });
}

class NetworkError extends ApiErrors {
  NetworkError({
    required super.message,
    super.statusRequest = StatusRequest.offlineFailure,
  });
}

class ResponseError extends ApiErrors {
  ResponseError(
      {required super.message,
      super.statusRequest = StatusRequest.failure,
      super.statusCode});
}

class TimeOutError extends ApiErrors {
  TimeOutError({
    required super.message,
    super.statusRequest = StatusRequest.timeOutFailure,
  });
}
