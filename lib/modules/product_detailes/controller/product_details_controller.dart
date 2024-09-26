import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/main/controller/main_page_controller.dart';
import 'package:e_comerce/modules/main/model/popular_model.dart';

import '../../../core/classes/status_request.dart';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../../favorite/data/favorit_data_imp.dart';
import '../../favorite/model/favorite_model.dart';
import '../data/product_det_data_imp.dart';

class ProductDetailsController extends GetxController {
  PopularItemModel productModel = Get.arguments["model"];

  FavoriteDataImp favoriteDataImp = FavoriteDataImp(httpMethods: Get.find());

  ProductDetailsDataImp productDetailsDataImp =
      ProductDetailsDataImp(httpMethods: Get.find());

  List<FavoriteModel> favoriteModel = [];
  MainPageControllerImp mainPageControllerImp = Get.find();

  // int quantity = 1;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequestForCart = StatusRequest.none;

  late int quantity = 1;

  addDataToFav() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productDetailsDataImp.addToFav(productModel.idItem);
    statusRequest = StatusRequest.none;
    update();
    response.fold(
      (l) {
        AppToasts.errorToast(l.message);
        statusRequest = StatusRequest.failure;
        update();
      },
      (r) {
        if (r["status"] == "success") {
          AppToasts.successToast("added successfully");
          productModel.favorite = '1';
          mainPageControllerImp.getData();
          update();
        }
      },
    );
  }

  // addDataToCart(string itemid) async {
  addDataToCart() async {
    statusRequestForCart = StatusRequest.loading;
    update();
    var respon = await productDetailsDataImp.addDataToCart(productModel.idItem);
    statusRequestForCart = StatusRequest.none;
    update();
    respon.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequestForCart = StatusRequest.failure;
      update();
    }, (r) {
      if (r["status"] == "success") {
        AppToasts.successToast("added successfully");
        // mainPageControllerImp.getData();

        update();
      }
    });
  }

  void delete() async {
    statusRequest = StatusRequest.loading;
    update();

    var responseDelete =
        await favoriteDataImp.deleteFromFav(productModel.idItem);
    statusRequest = StatusRequest.none;
    update();
    responseDelete.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
//  .favoriteModel[index] .favoriteItemsId
      if (r["status"] == "success") {
        productModel.favorite = '0';
        print("objectdelet");
        AppToasts.successToast("remove successfully");
        mainPageControllerImp.getData();
        update();
        // print("___________FavoriteController___${favoriteModel}");
      }
    });
  }

  @override
  void onInit() {
    quantity = int.parse(productModel.quantityItem);
    super.onInit();
  }
}
