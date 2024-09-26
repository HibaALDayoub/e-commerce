import 'package:e_comerce/core/app/local_storage/get_storage.dart';
import 'package:e_comerce/core/constant/local_storage_box/local_storage_box.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes/app_routes.dart';
import '../data/static/on_boarding_data.dart';

abstract class OnBoardingController extends GetxController {
  nextBtnPge();
  onPgeChangDots(int index);
}

class OnBoardingControllerImplement extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  nextBtnPge() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      GetStorageClass.setInt(key: LocalStorageBox.step, value: 1);
      Get.offAllNamed(AppRoutes().loginRoute2);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  onPgeChangDots(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
