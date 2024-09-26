

import '../../classes/status_request.dart';

class SuccessStateOutPut {
  final StatusRequest statusRequest;
  final List data;
  final bool isLast;

  SuccessStateOutPut(
      {required this.statusRequest, required this.data, required this.isLast});
}




class SuccessStateOutPutAsObject {
  final StatusRequest statusRequest;
  final dynamic data;

  SuccessStateOutPutAsObject(
      {required this.statusRequest, required this.data, });
}
