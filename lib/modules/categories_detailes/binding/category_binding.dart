import '../../../core/routes/routes_imports.dart';
import '../controller/categoryController.dart';
import '../data/category_data_imp.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
