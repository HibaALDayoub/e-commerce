import 'dart:developer';

import 'package:e_comerce/core/constant/routes/app_routes.dart';
import 'package:e_comerce/shared/widgets/loading/loading_dialog.dart';
import 'package:e_comerce/widgets/pop_up/toast_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/forget_passowrd_data_implement.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerFiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey();

  ForgetPasswordDataImp forgetPasswordDataImp =
      ForgetPasswordDataImp(httpMethods: Get.find());

  @override
  goToVerFiyCode() async {
    showLoadingDialog();
    final response =
        await forgetPasswordDataImp.forgetPassword(email: email.text);
    Get.back();
    response.fold((l) {
      log(l.message);
      AppToasts.errorToast(l.message);
    }, (r) {
      Get.toNamed(AppRoutes().verificationRoute);
      AppToasts.successToast("enter verification code please");
    });
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
