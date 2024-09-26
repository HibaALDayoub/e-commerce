import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/forget_password/controller/forget_password_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForgetPasswordControllerImp());
  }
}
