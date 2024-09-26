
import 'package:e_comerce/core/classes/status_request.dart';
import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/links/api_links.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../../shared/widgets/handling_api_request/retry_button.dart';
import '../../../../shared/widgets/images/custom_cached_net_image.dart';
import '../../controller/favorite_controller.dart';


class FavoritePage extends StatelessWidget {
  // var fav = Get.find;
  // late FavoriteModel favoriteModel;
  // favoriteModel

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (controller) =>
          // late f = controller.
          // print("fav page : __++++ ${controller.statusRequest}");
          controller.statusRequest == StatusRequest.loading
              ? const Center(
                  heightFactor: AppSize.appCustomRadius,
                  child: CircularProgressIndicator())
              : controller.statusRequest == StatusRequest.failure
                  ? RetryButton(onTap: () {
                      controller.getFavData();
                    })
                  : SizedBox(
                      height: AppSize.screenHeight(context: context) * 0.99,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.favoriteModel.length,
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemBuilder: (context, index) => Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  width: AppSize.screenWidth(context: context) *
                                      0.9,
                                  height: 140,
                                  decoration: BoxDecoration(
                                      color: AppColors().lightGrey3,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(children: [
                                    CustomCachedNetImage(
                                        borderRadius: 20,
                                        height: 120,
                                        width: AppSize.screenWidth(
                                                context: context) *
                                            0.32,
                                        fit: BoxFit.contain,
                                        // "${ApiLinks.itemsImageLink}/${controller.itemList[ind].imageItem}"
                                        imageUrl:
                                            "${ApiLinks.itemsImageLink}/${controller.favoriteModel[index].itemImage}"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              controller.favoriteModel[index]
                                                  .itemName,
                                              style: TextStyle(
                                                  color: AppColors().black)),
                                          Row(
                                            children: [
                                              Text(
                                                  controller
                                                      .favoriteModel[index]
                                                      .itemRate,
                                                  style: TextStyle(
                                                      color: AppColors()
                                                          .darkGrey)),
                                              const Icon(
                                                size: 25,
                                                Icons.star,
                                                color: AppColors.yellow,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "${controller.favoriteModel[index].itemPrice} \$",
                                                  style: TextStyle(
                                                      color: AppColors().lRed,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15)),
                                              Container(
                                                alignment:
                                                    Alignment.bottomRight,
                                                //IconButton(
                                                // onPressed: () {
                                                //   if (controller.productModel.favorite ==
                                                //       '0') {
                                                //     controller.addDataToFav();
                                                //   }
                                                //   // add to favorite
                                                // },
                                                // icon: Icon(
                                                //   controller.productModel.favorite == '0'
                                                //       ? Icons.favorite_border
                                                //       : Icons.favorite,
                                                // ),
                                                // color: AppColors().lightRed)),

                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.delete(
                                                          controller
                                                              .favoriteModel[
                                                                  index]
                                                              .favoriteItemsId);
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .delete_outline_outlined,
                                                      color: AppColors().lRed,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ])),
                    ),
    );

    // Column(children: [
    //   const Text(
    //     "data",
    //     style: TextStyle(color: Color.fromARGB(255, 135, 179, 174)),
    //   ),
    //   Container(
    //     width: AppSize.screenWidth(context: context) * 0.9,
    //     height: 140,
    //     decoration: BoxDecoration(
    //         color: Color.fromARGB(255, 162, 143, 143),
    //         borderRadius: BorderRadius.circular(20)),
    //     child:
    //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //       Container(
    //         width: 60,
    //         height: 70,
    //         color: AppColors.pink,
    //       ),
    //       // CustomCachedNetImage(
    //       //     height: 80,
    //       //     width: AppSize.screenWidth(context: context) * 0.4,
    //       //     fit: BoxFit.cover,
    //       //     imageUrl: imgUrlItem),
    //       Container(
    //         child: Column(children: [
    //           Text("data,"),
    //           Text("data,"),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [Text("data5"), Icon(Icons.delete)],
    //           )
    //         ]),
    //       )
    //     ]),
    //   )
    // ]);
  }
}
