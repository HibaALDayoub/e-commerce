import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_comerce/core/constant/routes/app_routes.dart';
import 'package:e_comerce/core/constant/size/app_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/app_services.dart';
import '../../../on_boarding/view/pages/on_boarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            splashIconSize: 120,
            animationDuration: const Duration(seconds: 2),
            splash: SizedBox(
              child: Image.asset(
                "assets/app_icon.png",
                fit: BoxFit.contain,
                height: AppSize.screenHeight(context: context) * 0.6,
                width: AppSize.screenWidth(context: context),
                // width: 70,
              ),
            ),
            nextRoute: AppServices.step == 0
                ? AppRoutes.onBoardingRoute
                : AppServices.userId.isNotEmpty
                    ? AppRoutes.mainRoute
                    : AppRoutes().loginRoute2,
            nextScreen: const OnBoardingPage()));
  }
}
