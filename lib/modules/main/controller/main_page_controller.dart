import 'dart:developer';

import 'package:e_comerce/core/classes/status_request.dart';
import 'package:e_comerce/core/constant/colors/app_colors.dart';
import 'package:e_comerce/modules/favorite/view/page/favorite_page.dart';
import 'package:e_comerce/modules/main/model/category_model.dart';
import 'package:e_comerce/widgets/pop_up/toast_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/routes/routes_imports.dart';
import '../../home/view/pages/home_page.dart';
import '../data/main_data_impl.dart';
import '../model/popular_model.dart';

class MainPageControllerImp extends GetxController {
  List<Widget> mainWidgets = [
    const HomePage(),
    FavoritePage(),
    Container(
      height: 300,
      width: 300,
      color: AppColors().red,
    ),
    Container(
      height: 300,
      width: 300,
      color: AppColors.blue,
    ),
  ];
  StatusRequest statusRequest = StatusRequest.none;
  MainDataImpl mainDataImpl = MainDataImpl(httpMethods: Get.find());
  List<CategoryModel> categories = [];
  List<PopularItemModel> popularItemList = [];
  List<PopularItemModel> itemList = [];
  int selected = 0;
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await mainDataImpl.getHomeData();
    statusRequest = StatusRequest.none;
    update();
    response.fold((l) {
      AppToasts.errorToast(l.message);
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
      // log("data is $r");
      if (r['status'] == 'success') {
        List responseCategoryList = r['categories']['data'];
        categories =
            responseCategoryList.map((e) => CategoryModel.fromJson(e)).toList();
        // ____________________________

        List responsePopularItemList = r['popularitems']['data'];
        popularItemList = responsePopularItemList
            .map((e) => PopularItemModel.fromJson(e))
            .toList();
        // ____________________________
        List responseItemList = r['items']['data'];
        itemList =
            responseItemList.map((e) => PopularItemModel.fromJson(e)).toList();
        update();
        print(
            "=============//=============items length ${popularItemList.length}");
      }
    });
  }

  @override
  void onInit() {
    // like init state
    getData();
    super.onInit();
  }
}
