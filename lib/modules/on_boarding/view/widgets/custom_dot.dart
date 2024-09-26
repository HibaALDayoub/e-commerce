import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/on_boarding/controller/on_boarding_controller.dart';
import 'package:flutter/material.dart';

import '../../data/static/on_boarding_data.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImplement>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(seconds: 1),
                    width: controller.currentPage == index ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
