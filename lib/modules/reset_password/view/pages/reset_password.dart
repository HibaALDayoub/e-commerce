import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../../../widgets/fields/custom_text_form_field.dart';
import '../../../login/view/widgets/custom_text_header_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
      appBar: customAppBar(
          title: "Reset Password", context: context, isBack: false),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextHeaderAuth(
              headerText: "Enter new password",
              underHeaderText:
                  " Enter a new password and confirm it to restore your account"),
          const SizedBox(height: 25),
          const CustomTextFormField(
            hint: "Enter Your Password",
            labelText: "Password",
            icon: Icons.lock_outline,
          ),

          const SizedBox(
            height: 10,
          ),
          const CustomTextFormField(
            hint: "Re_Enter Password",
            labelText: "Confirm Password",
            icon: Icons.lock_outline,
          ),
          // validateText: "please enter a password",

          const SizedBox(height: 140),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: MaterialButton(
              onPressed: () {
                if (formState.currentState!.validate()) {
                  debugPrint("object");
                } else {
                  debugPrint("jjjjjj");
                }
              },
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: AppColors.primaryColor,
              textColor: Colors.white,
              minWidth: 270,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Continue",
                style: TextStyle(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
