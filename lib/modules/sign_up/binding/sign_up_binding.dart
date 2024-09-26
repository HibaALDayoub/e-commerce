import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/sign_up/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpControllerImp());
  }
}
