import '../../../core/routes/routes_imports.dart';
import '../controller/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController());
  }
}
