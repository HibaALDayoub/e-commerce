import 'dart:developer';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../../api/dio/errors/api_errors.dart';
import '../../classes/status_request.dart';

class ShowApiErrorHelper {
  static ApiErrors handleErrorState({required ApiErrors errors, int? page}) {
    StatusRequest status = StatusRequest.none;
    bool isTokenError = false;
    if (page != null) {
      if (page > 1) {
        page--;
        status = StatusRequest.paginatingFailure;
      } else {
        status = StatusRequest.failure;
      }
    } else {
      status = StatusRequest.failure;
    }
    var message = errors.message;
    log(message);
    if (!message.contains("expired")) {
      AppToasts.errorToast(message);
      isTokenError = false;
    } else {
      isTokenError = true;
    }
    AppToasts.errorToast(message);
    return ApiErrors(
      isTokenError: isTokenError,
      message: message,
      statusRequest: status,
    );
  }
}
