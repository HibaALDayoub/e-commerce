import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/login/controller/login_controller.dart';

class LogInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginControllerImp());
  }
}
