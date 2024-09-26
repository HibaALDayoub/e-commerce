import '../../../core/classes/status_request.dart';
import '../../../core/routes/routes_imports.dart';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../data/favorit_data_imp.dart';
import '../model/favorite_model.dart';

class FavoriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteDataImp favoriteDataImp = FavoriteDataImp(httpMethods: Get.find());

  List<FavoriteModel> favoriteModel = [];

  void getFavData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteDataImp.viewFavoriteData();
    statusRequest = StatusRequest.none;

  
    response.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
      // print("__________PAGE:fav contr ___________________${r}");
      if (r["status"] == "success") {
        List responseFavoriteList = r["data"];
        favoriteModel =
            responseFavoriteList.map((e) => FavoriteModel.fromJson(e)).toList();
        update();
        // print("_____________________________${responseFavoriteList}");
        // update();
      }
    });
  }

  void delete(String favId) async {
    statusRequest = StatusRequest.loading;
    var responseDelete = await favoriteDataImp.deleteFromFav(favId);

    responseDelete.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
      print("objectdelet");
      if (r["status"] == "success") {
        favoriteModel
            .removeWhere((element) => element.favoriteItemsId == favId);
        AppToasts.successToast("remove successfully");

        update();
        // print("___________FavoriteController___${favoriteModel}");
      }
    });
  }

  @override
  void onInit() {
    // like init state
    getFavData();
    super.onInit();
  }
}
