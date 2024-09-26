import 'dart:developer';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../../classes/status_request.dart';

class HandlePaginateStateHelper {
  static StatusRequest handleErrorState(
      {required int page, required Map<dynamic, dynamic> r}) {
    StatusRequest statusRequest = StatusRequest.none;
    var message = r['messages'];
    log(message[0]);
    AppToasts.errorToast(message[0]);
    if (page > 1) {
      page--;
      statusRequest = StatusRequest.paginatingFailure;
    } else {
      statusRequest = StatusRequest.failure;
    }
    return statusRequest;
  }

  static StatusRequest handleLoadState({required int page}) {
    StatusRequest statusRequest = StatusRequest.none;
    if (page > 1) {
      statusRequest = StatusRequest.paginating;
    } else {
      statusRequest = StatusRequest.loading;
    }
    return statusRequest;
  }
}
