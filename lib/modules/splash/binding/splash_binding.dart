import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/splash/controller/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
