import 'package:e_comerce/core/constant/routes/app_routes.dart';
import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  @override
  signUp() {
    // debugPrint(password.text);
    Get.toNamed(AppRoutes().completeRegisterRoute);
  }

  @override
  goToSignIn() {
    Get.toNamed(AppRoutes().loginRoute2);
  }

  @override
  void onInit() {
    //initialize value
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
