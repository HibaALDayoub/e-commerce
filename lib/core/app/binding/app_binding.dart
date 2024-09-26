import 'package:get/get.dart';

import '../../api/dio/dio_crud/http_methods.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // to injection the crud class from the start of the application work
    Get.put(HttpMethods());
  }
}
