import 'dart:developer';

import 'package:flutter/material.dart';

import '../../classes/status_request.dart';
import 'success_output.dart';

class HandleSuccessStateHelper {
  static SuccessStateOutPut handleSuccessStateAsListData(
      {required Map<dynamic, dynamic> data, int? page}) {
    List responseData = data['data'];
    debugPrint("response data length ${responseData.length}");
    List dataList = [];
    StatusRequest status = StatusRequest.none;
    bool isLast = false;
    if (page != null) {
      log("is Last page $isLast $page ${data['totalPages']}");
      if (page == data['totalPages'] || responseData.isEmpty) {
        isLast = true;
      }
    }
 dataList = responseData;
    return SuccessStateOutPut(
        statusRequest: status, data: dataList, isLast: isLast);
  }

  static SuccessStateOutPutAsObject handleSuccessStateAsObject({
    required Map<dynamic, dynamic> data,
  }) {
    dynamic responseData = data['data'];
    debugPrint("data response is $responseData");
    StatusRequest status = StatusRequest.none;
    return SuccessStateOutPutAsObject(
      statusRequest: status,
      data: responseData,
    );
  }
}
