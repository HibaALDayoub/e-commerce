import 'package:e_comerce/core/helper/validation/validations_errors.dart';
import 'package:e_comerce/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/classes/validation_type.dart';
import '../../../../widgets/fields/custom_text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.find();
    return Form(
      key: controller.formState,
      child: Column(children: [
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          textEditingController: controller.email,
          hint: "Enter Your Email ",
          labelText: "Email",
          icon: Icons.email,
          inputType: TextInputType.emailAddress,
          validator: (value) {
            return ValidationErrors.fieldValidation(
                value: value!,
                minValue: 1,
                maxValue: 1000,
                validationType: ValidationType.email);
          },
          //   // validateText: "please enter a valid email"
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          textEditingController: controller.password,

          hint: 'password',
          labelText: "password",
          icon: Icons.lock_outline,
          validator: (value) {
            return ValidationErrors.fieldValidation(
                value: value!,
                minValue: 8,
                maxValue: 100,
                validationType: ValidationType.anyThings);
          },
          //     // validateText: "please enter a phone number",
        ),
      ]),
    );
  }
}
