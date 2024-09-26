import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../../../widgets/fields/custom_text_form_field.dart';
import '../../../login/view/widgets/custom_text_header_auth.dart';
import '../../controller/sign_up_controller.dart';
import '../widget/text_sign_in_with_up.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.find();

    return MaterialApp(
      home: Scaffold(
          appBar:
              customAppBar(title: "SignUp", context: context, isBack: false),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: ListView(
              children: [
                const CustomTextHeaderAuth(
                    headerText: "Register Account",
                    underHeaderText:
                        "Complete details or continue with social media"),
                const SizedBox(
                  height: 10,
                ),
                Form(
                    key: formState,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          hint: "Enter Your Email ",
                          labelText: "Email",
                          icon: Icons.email,
                          //   // validateText: "please enter a valid email"
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                          hint: 'password',
                          labelText: "password",
                          icon: Icons.lock_outline,
                          //     // validateText: "please enter a phone number",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                          hint: 'Confirm Password',
                          labelText: "Re_Enter Password",
                          icon: Icons.lock_outline,
                          //     // validateText: "please enter a phone number",
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 150,
                ),
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: MaterialButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            controller.signUp();
                            debugPrint("object");
                          } else {
                            debugPrint("jjjjjj");
                          }
                        },
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        minWidth: 270,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "continue",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextSignInWithSignUp(
                      text1: "you have an account ?",
                      text2: " Log in",
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
