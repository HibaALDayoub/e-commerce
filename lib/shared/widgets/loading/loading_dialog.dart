import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors/app_colors.dart';
showLoadingDialog({Color?color}) {
  return Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child:  CircularProgressIndicator(
            color:color?? AppColors.primaryColor,
          ),
        ),
      ));
}
