import 'package:get/get.dart';

import '../controller/Verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VerificationController());
  }
}
