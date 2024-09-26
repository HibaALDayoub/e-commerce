import 'package:e_comerce/core/routes/routes_imports.dart';

import '../controller/complete_register_controller.dart';

class CompleteRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CompleteRegisterControllerImp());
  }
}
