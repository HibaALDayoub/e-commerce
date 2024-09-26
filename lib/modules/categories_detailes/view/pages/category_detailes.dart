import 'package:dartz/dartz.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_comerce/core/constant/colors/app_colors.dart';
import 'package:e_comerce/modules/main/controller/main_page_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/links/api_links.dart';
import '../../../../core/classes/status_request.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../../core/routes/routes_imports.dart';
import '../../../../shared/widgets/handling_api_request/retry_button.dart';
import '../../../../shared/widgets/images/custom_cached_net_image.dart';
import '../../../../shared/widgets/scaffold/custom_app_bar.dart';
import '../../controller/categoryController.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.find();

    MainPageControllerImp mainPageControllerImp = Get.find();
    return Scaffold(
        appBar: customAppBar(
          title: "category",
          context: context,
        ),
        body: Column(
          children: [
            DefaultTabController(
              length: mainPageControllerImp.categories.length,
              initialIndex: controller.currentIndex,
              child: TabBar(
                  indicatorColor: AppColors().lightGrey2,
                  indicatorWeight: 4,
                  isScrollable: true,
                  labelColor: AppColors().green,
                  unselectedLabelColor: AppColors().green,
                  onTap: (val) {
                    controller.categoryModel =
                        mainPageControllerImp.categories[val];
                    controller.getCategoryData();
                  },
                  tabs: [
                    ...List.generate(
                        mainPageControllerImp.categories.length,
                        (index) =>
                            Text(mainPageControllerImp.categories[index].name)),
                  ]),
            ),
            GetBuilder<CategoryController>(
              builder: (controller) => controller.statusRequest ==
                      StatusRequest.loading
                  ? Column(
                      children: [
                        SizedBox(
                          height: AppSize.screenHeight(context: context) * 0.4,
                        ),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    )
                  : controller.statusRequest == StatusRequest.failure
                      ? Column(
                          children: [
                            SizedBox(
                              height:
                                  AppSize.screenHeight(context: context) * 0.4,
                            ),
                            RetryButton(onTap: () {
                              controller.getCategoryData();
                            }),
                          ],
                        )
                      : Expanded(
                          child: DynamicHeightGridView(
                          shrinkWrap: true,
                          itemCount: controller.popularItemList.length,
                          crossAxisCount: 2,
                          builder: (ctx, index) {
                            return Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: const Color.fromARGB(255, 230, 224, 220),
                              ),
                              height: 280,
                              width: 220,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                      color: AppColors().lightGrey2,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    height: 130,
                                    width: double.infinity,
                                    child: CustomCachedNetImage(
                                      fit: BoxFit.contain,
                                      imageUrl:
                                          "${ApiLinks.itemsImageLink}/${controller.popularItemList[index].imageItem}",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.popularItemList[index].nameItem,
                                    style: TextStyle(
                                        color: AppColors().lightGrey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controller.popularItemList[index].nameItem,
                                    style: TextStyle(color: AppColors.deepGrey),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
            ),
          ],
        ));
  }
}

//    TabBar(
                // indicatorColor: AppColors().lightGrey3,
                // indicatorWeight: 3,
                // labelColor: AppColors().green,
                // unselectedLabelColor: AppColors().green,
                // tabs: [
                //   ...List.generate(
                //       mainPageControllerImp.categories.length,
                //       (index) =>
                //           Text(mainPageControllerImp.categories[index].name)),
                // ]),
