import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/core/theme/dark/dark_theme_text.dart';
import 'package:e_comerce/modules/main/controller/main_page_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/links/api_links.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../main/view/widget/item_list_main.dart';
import '../../../main/view/widget/list_categoriesandpopular_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageControllerImp controller = Get.find();
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: AppColors.bluePurpleM,
              borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(
            height: 130,
            child: ListView.separated(
              itemCount: controller.categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, ind) {
                return ListCategoriesAndPopularMain(
                  imageUrlCategories:
                      "${ApiLinks.categoriesImageLink}/${controller.categories[ind].image}",
                  categoryName: controller.categories[ind].name,
                  onTap: () {
                    Get.toNamed(AppRoutes.categoryDetails, arguments: {
                      "model": controller.categories[ind],
                      "index": ind
                    });
                  },
                );
              },
            )),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special for you",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Text(
              "See more",
              style: TextStyle(color: AppColors.deepGrey),
            ),
          ],
        ),
        SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.itemList.length,
            itemBuilder: (cont, ind) {
              return ItemListMain(
                  imgUrlItem:
                      "${ApiLinks.itemsImageLink}/${controller.itemList[ind].imageItem}",
                  nameItem: controller.itemList[ind].nameItem);
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular Product",
                style: Theme.of(context).textTheme.displayMedium),
            const Text(
              "See more",
              style: TextStyle(color: AppColors.deepGrey),
            ),
          ],
        ),
        SizedBox(
          height: 136,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.popularItemList.length,
            itemBuilder: (cont, ind) {
              return ListCategoriesAndPopularMain(
                onTap: () {
                  Get.toNamed(AppRoutes.productDetails, arguments: {
                    "model": controller.popularItemList[ind],
                  });
                },
                imageUrlCategories:
                    "${ApiLinks.itemsImageLink}/${controller.popularItemList[ind].imageItem}",
                height: 110,
                width: AppSize.screenWidth(context: context) * 0.4,
                colorContainer: AppColors.backColorLight,
                borderRadius: BorderRadius.circular(20),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ),
        )
      ],
    );
  }
}
