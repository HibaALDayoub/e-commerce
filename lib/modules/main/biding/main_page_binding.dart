import '../../../core/routes/routes_imports.dart';
import '../../favorite/controller/favorite_controller.dart';
import '../controller/main_page_controller.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteController());
    Get.put(MainPageControllerImp());
  }
}
