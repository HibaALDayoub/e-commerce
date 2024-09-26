import 'package:e_comerce/core/classes/status_request.dart';
import 'package:e_comerce/core/constant/colors/app_colors.dart';

import 'package:e_comerce/modules/product_detailes/controller/product_details_controller.dart';
import 'package:e_comerce/shared/widgets/images/custom_cached_net_image.dart';
import 'package:e_comerce/shared/widgets/loading/loading_points.dart';
import 'package:e_comerce/widgets/buttons/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/api/links/api_links.dart';
import '../../../../core/routes/routes_imports.dart';
import '../widgets/count_item.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.find();
    final idd = controller.productModel.categoryId;
    // final gg = controller.favoriteModel[].favoriteItemsId;
    return Scaffold(
      backgroundColor: AppColors().lightGrey2,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(50),
              height: 200,
              width: double.infinity,
              child: CustomCachedNetImage(
                fit: BoxFit.contain,
                imageUrl:
                    "${ApiLinks.itemsImageLink}/${controller.productModel.imageItem}",
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(top: 17, bottom: 17, left: 17),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                color: AppColors().lightGrey3,
              ),
              width: double.infinity,
              height: 400,
              child: ListView(
                children: [
                  Text(
                    controller.productModel.nameItem,
                    style: TextStyle(
                        color: AppColors().black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          RatingBar.builder(
                            itemCount: 5,
                            allowHalfRating: true,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: ((value) {
                              debugPrint("value  : $value");
                            }),
                          ),
                        ],
                      )),
                      Container(
                          width: 80,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: AppColors.lightPink,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  topLeft: Radius.circular(25))),
                          child: GetBuilder<ProductDetailsController>(
                            builder: (controller) => controller.statusRequest ==
                                    StatusRequest.loading
                                ? const LoadingPoint(
                                    color: AppColors.cyan,
                                  )

                                // onTap: () => controller.favoriteModel,
                                : IconButton(
                                    onPressed: () {
                                      if (controller.productModel.favorite ==
                                          '0') {
                                        controller.addDataToFav();
                                      } else {
                                        controller.delete();
                                      }
                                    },
                                    icon: Icon(
                                      controller.productModel.favorite == '0'
                                          ? Icons.favorite_border
                                          : Icons.favorite,
                                    ),
                                    color: AppColors().lightRed),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: AppColors().black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  ReadMoreText(
                    controller.productModel.descriptionItem,
                    trimLines: 2,
                    preDataTextStyle:
                        const TextStyle(fontWeight: FontWeight.w500),
                    style: TextStyle(color: AppColors().lightGrey),
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors().lightRed),
                    colorClickableText: AppColors().lightRed,
                    trimCollapsedText: 'See More Details >',
                    trimExpandedText: ' show less',
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: AppColors().black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                        const TextSpan(text: "Price : "),
                        TextSpan(
                          text: "${controller.productModel.priceItem} \$",
                          style: TextStyle(
                            color: AppColors().lRed,
                            fontSize: 18,
                          ),
                        )
                      ])),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Categories : ${controller.productModel.categoryName}",
                    style: TextStyle(
                        color: AppColors().lightGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder<ProductDetailsController>(
                    builder: (controller) => CountItem(
                      count: controller.quantity,
                      onAdd: () {
                        controller.quantity++;
                        controller.update();
                        print(controller.quantity);
                      },
                      onRemove: () {
                        if (controller.quantity >= 1) {
                          controller.quantity--;
                          controller.update();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      buttonBody: "Add to cart",
                      onTap: () {
                        controller.addDataToCart();
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
