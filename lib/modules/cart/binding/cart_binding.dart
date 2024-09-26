import '../../../core/routes/routes_imports.dart';
import '../controller/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
