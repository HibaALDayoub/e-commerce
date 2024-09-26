import '../../../core/classes/status_request.dart';
import '../../../core/routes/routes_imports.dart';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../../favorite/model/favorite_model.dart';
import '../data/cart_data_implement.dart';

class CartController extends GetxController {
  // FavoriteModel cartModelg = Get.arguments["model"];
  StatusRequest statusRequestCart = StatusRequest.none;
  CartDataImpl cartDataImp = CartDataImpl(httpMethods: Get.find());

  List<FavoriteModel> cartModel = [];
  void getCartData() async {
    statusRequestCart = StatusRequest.loading;
    update();
    var response = await cartDataImp.viewCart();
    statusRequestCart = StatusRequest.none;

    update();
    response.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequestCart = StatusRequest.failure;
      update();
    }, (r) {
      if (r["status"] == "success") {
        List responseCartList = r["data"];
        cartModel =
            responseCartList.map((e) => FavoriteModel.fromJson(e)).toList();
        update();
      }
    });
  }

  // addDataToCart() async {
  //   CartDataImpl cartDataImpl = CartDataImpl(httpMethods: Get.find());
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartDataImpl.addToCart(cartModel.itemId);
  //   statusRequest = StatusRequest.none;
  //   update();
  //   response.fold((l) {
  //     AppToasts.errorToast(l.message);
  //     statusRequest = StatusRequest.failure;
  //     update();
  //   }, (r) {
  //     if (r["status"] == "success") {
  //       AppToasts.successToast("added successfully");

  //       update();
  //     }
  //   });
  // }
}
