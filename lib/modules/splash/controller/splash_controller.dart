import 'package:e_comerce/core/constant/routes/app_routes.dart';
import 'package:e_comerce/core/routes/routes_imports.dart';

import '../../../core/services/app_services.dart';

class SplashController extends GetxController {
  navigate() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppServices.step == 0
          ? AppRoutes.onBoardingRoute
          : AppRoutes().loginRoute2);
    });
  }

  @override
  void onInit() {
    // navigate();
    super.onInit();
  }
}
