import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../../sign_up/view/widget/text_sign_in_with_up.dart';
import '../../controller/login_controller.dart';
import '../widgets/custom_text_header_auth.dart';
import '../widgets/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.find();

    return MaterialApp(
      home: Scaffold(
        appBar: customAppBar(title: "Login", context: context, isBack: false),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            const SizedBox(
              height: 10,
            ),
            const CustomTextHeaderAuth(
                headerText: "Log In",
                underHeaderText: "Sign In With Your Email And Password"),
            const SizedBox(
              height: 65,
            ),
            LoginFormWidget(),
            const SizedBox(
              height: 160,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: MaterialButton(
                onPressed: () {
                  controller.login();
                },
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: AppColors.primaryColor,
                textColor: Colors.white,
                minWidth: 270,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Login",
                  style: TextStyle(),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                controller.goToForgetPassword();
              },
              child: const Text(
                "  Forget Password",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextSignInWithSignUp(
              text1: "Don't have an account ?",
              text2: "Register now",
              onTap: () {
                controller.goToSignUp();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
