import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../../login/view/widgets/custom_text_header_auth.dart';
import '../../controller/Verification_controller.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    VerificationController controller = Get.find();

    return Scaffold(
      appBar: customAppBar(
          title: "OTP Verification", context: context, isBack: false),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextHeaderAuth(
              headerText: "OTP Verification",
              underHeaderText:
                  "we send your code to your email this code will expired in 00:24"),
          const SizedBox(height: 160),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: MaterialButton(
              onPressed: () {
                controller.goTo();
                // if (formState.currentState!.validate()) {
                //   debugPrint("object");
                // } else {
                //   debugPrint("jjjjjj");
                // }
              },
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.black26,
              textColor: Colors.white,
              minWidth: 270,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Resend",
                style: TextStyle(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "resend OTP Code",
            style: TextStyle(color: Colors.black26),
          )
        ]),
      ),
    );
  }
}
