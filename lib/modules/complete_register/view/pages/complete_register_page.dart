import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/routes/routes_imports.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../../../widgets/fields/custom_text_form_field.dart';
import '../../../login/view/widgets/custom_text_header_auth.dart';

import '../../controller/complete_register_controller.dart';

class CompleteRegisterPage extends StatelessWidget {
  CompleteRegisterPage({super.key});
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    CompleteRegisterControllerImp controller = Get.find();

    return MaterialApp(
      home: Scaffold(
          appBar:
              customAppBar(title: "Sign Up", context: context, isBack: true),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: ListView(
              children: [
                const CustomTextHeaderAuth(
                    headerText: "Complete Profile",
                    underHeaderText:
                        "Complete your details or continue with social media"),
                const SizedBox(
                  height: 30,
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
                          hint: "Enter Your Name ",
                          labelText: "Name",
                          icon: Icons.person_3_outlined,
                          //   // validateText: "please enter a valid email"
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                          hint: 'Enter Your Phone Number',
                          labelText: "Phone Number",
                          icon: Icons.mobile_friendly_rounded,
                          //     // validateText: "please enter a phone number",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                          hint: 'Address',
                          labelText: "Enter Your Address",
                          icon: Icons.location_on_outlined,
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
                    // TextSignInWithSignUp(
                    //   text1: "you have an account ?",
                    //   text2: " Log in",
                    //   onTap: () {
                    //     controller.goToSignIn();
                    //   },
                    // ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
