import 'package:flutter/material.dart';

import '../../../../core/routes/routes_imports.dart';
import '../../controller/on_boarding_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dot.dart';
import '../widgets/slider_custom.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImplement());
    return const Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SliderCustomOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotOnBoarding(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ],
          )),
    );
  }
}
