import 'package:flutter/material.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../../core/routes/routes_imports.dart';
import '../../controller/on_boarding_controller.dart';
import '../../data/static/on_boarding_data.dart';

class SliderCustomOnBoarding extends GetView<OnBoardingControllerImplement> {
  const SliderCustomOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenHeight(context: context) * 0.7,
      width: AppSize.screenWidth(context: context),
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.onPgeChangDots(value);
          },
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Text(
                      onBoardingList[i].title,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                      // const TextStyle(fontSize: 20, color: Colors.orange)
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        onBoardingList[i].body,
                        textAlign: TextAlign.center,
                        style: const TextStyle(height: 2, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: AppSize.screenHeight(context: context) * 0.4,
                      width: AppSize.screenWidth(context: context) * 0.7,
                      child: Image.asset(
                        onBoardingList[i].image,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
