import 'dart:developer';

import 'package:e_comerce/core/app/local_storage/get_storage.dart';
import 'package:e_comerce/core/classes/status_request.dart';
import 'package:e_comerce/core/constant/routes/app_routes.dart';
import 'package:e_comerce/core/services/app_services.dart';
import 'package:e_comerce/modules/login/data/login_data_impl.dart';
import 'package:e_comerce/shared/widgets/loading/loading_dialog.dart';
import 'package:e_comerce/widgets/pop_up/toast_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/local_storage_box/local_storage_box.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  final GlobalKey<FormState> formState = GlobalKey();
  LoginDataImpl loginDataImpl = LoginDataImpl(httpMethods: Get.find());
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSignUp() {
    Get.toNamed(AppRoutes().signUpRoute);
  }

  @override
  login() async {
    log("message");
    // Get.offAndToNamed(AppRoutes.mainRoute);

    // if (formState.currentState!.validate()) {
    showLoadingDialog();
    // statusRequest = StatusRequest.loading;
    // update();

    //response contain error or data
    debugPrint("email is ${email.text} password is ${password.text}");
    var response =
        await loginDataImpl.login(email: email.text, password: password.text);
    Get.back();
    // statusRequest = StatusRequest.none;
    // update();
    response.fold((l) {
      log(l.message);
      AppToasts.errorToast(l.message);
      // statusRequest = StatusRequest.failure;
      // update();
    }, (r) async {
      if (r['status'] == 'success') {
        await GetStorageClass.setString(
            key: LocalStorageBox.userId, value: r["data"]["user_id"]);
        //first login to make user id get value
        AppServices.userId = r["data"]["user_id"];
        Get.offAndToNamed(AppRoutes.mainRoute);
        AppToasts.successToast("Login successfully");
      } else {
        AppToasts.errorToast('incorrect email or password');
      }
    });
    // } else {
    //   log("not valid");
    // }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes().forgetPasswordRouteRoute);
  }
}
