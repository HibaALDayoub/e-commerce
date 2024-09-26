import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/on_boarding/controller/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingControllerImplement());
  }
}
