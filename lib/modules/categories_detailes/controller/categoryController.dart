import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:flutter/material.dart';

import '../../../core/classes/status_request.dart';
import '../../../widgets/pop_up/toast_snack_bar.dart';
import '../../main/model/category_model.dart';
import '../../main/model/popular_model.dart';
import '../data/category_data_imp.dart';

class CategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  CategoryModel categoryModel = Get.arguments["model"];
  // PopularItemModel productModel = Get.arguments["model"];
  StatusRequest statusRequest = StatusRequest.none;
  int currentIndex = Get.arguments["index"];
  CategoryDataImp categoryDataImp = CategoryDataImp(httpMethods: Get.find());
  List<CategoryModel> categories = [];
  List<PopularItemModel> popularItemList = [];
  // String categories_name = "";

  void getCategoryData() async {
    popularItemList.clear();
    debugPrint("category id is ${categoryModel.id}");
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryDataImp.viewCategoryData(categoryModel.id);
    statusRequest = StatusRequest.none;
    update();
    debugPrint("length +++++++${popularItemList.length}");
    response.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
      if (r["status"] == "success") {
        List responseCategoryList = r['data'];
        List responsePopularItemList = r['data'];

        popularItemList = responsePopularItemList
            .map((e) => PopularItemModel.fromJson(e))
            .toList();
        debugPrint("length +++++++${popularItemList.length}");
        update();
      }
    });
  }

  @override
  void onInit() {
    print("catt ${categories}");
    // print("catt ${categories_name}");
    // like init state

    getCategoryData();
    super.onInit();
  }
}
