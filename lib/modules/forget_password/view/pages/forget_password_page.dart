import 'package:e_comerce/core/helper/validation/validations_errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/classes/validation_type.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/routes/routes_imports.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../../../widgets/fields/custom_text_form_field.dart';
import '../../../login/view/widgets/custom_text_header_auth.dart';
import '../../controller/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.find();

    return Scaffold(
      appBar: customAppBar(
        title: "Forget Password",
        context: context,
        isBack: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextHeaderAuth(
                headerText: "Forget Password",
                underHeaderText:
                    "please Enter Your Email and we will send you a lin; to return to your account"),
            const SizedBox(height: 25),
            CustomTextFormField(
              hint: "Enter Your Email ",
              labelText: "Email",
              icon: Icons.email,
              validator: (value) {
                return ValidationErrors.fieldValidation(
                    value: value!,
                    minValue: 1,
                    maxValue: 100,
                    validationType: ValidationType.email);
              },
            ),
            const SizedBox(height: 140),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: MaterialButton(
                onPressed: () {
                  if (controller.formState.currentState!.validate()) {
                    controller.goToVerFiyCode();
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
      ),
    );
  }
}
