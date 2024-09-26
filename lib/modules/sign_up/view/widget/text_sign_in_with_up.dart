import 'package:e_comerce/core/constant/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TextSignInWithSignUp extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;

  const TextSignInWithSignUp(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
       
          style: const TextStyle(fontSize: 12),
        ),
        InkWell(
          onTap: onTap,
          // Get.toNamed(AppRoutes.signupRoute1);

          child: Text(
            text2,
            // "  Register now",
            style: const TextStyle(fontSize: 15, color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
