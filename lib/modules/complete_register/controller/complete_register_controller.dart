import 'package:e_comerce/core/routes/routes_imports.dart';

abstract class CompleteRegisterController extends GetxController {
  goToMainPage();
}

class CompleteRegisterControllerImp extends CompleteRegisterController {
  // late TextEditingController username;

  @override
  goToMainPage() {
    // Get.toNamed(AppRoutes().mainPage);
  }

  @override
  void onInit() {
    //initialize value
    // username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // username.dispose();
    super.dispose();
  }
}
