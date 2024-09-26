import 'package:flutter/material.dart';

import '../../../../core/api/links/api_links.dart';
import '../../../../core/classes/status_request.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../../core/routes/routes_imports.dart';
import '../../../../shared/widgets/handling_api_request/retry_button.dart';
import '../../../../shared/widgets/images/custom_cached_net_image.dart';
import '../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CartPage")),
      body: GetBuilder<CartController>(
        builder: (controller) => controller.statusRequestCart ==
                StatusRequest.loading
            ? const Center(
                heightFactor: AppSize.appCustomRadius,
                child: CircularProgressIndicator())
            : controller.statusRequestCart == StatusRequest.failure
                ? RetryButton(onTap: () {
                    // controller.addDataToCart();
                  })
                :
                // Container(
                //     child: Text("welcome to cart",
                //         style: TextStyle(color: Colors.black)),
                //   )
                SizedBox(
                    height: AppSize.screenHeight(context: context) * 0.99,
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.cartModel.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemBuilder: (context, index) => Column(children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width:
                                    AppSize.screenWidth(context: context) * 0.9,
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
                                      imageUrl: ""
                                      // "${ApiLinks.itemsImageLink}/${controller.cartModel[index].itemImage}"
                                      ),
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
                                        Text("lll",
                                            // controller
                                            //     .cartModel[index].itemName,
                                            style: TextStyle(
                                                color: AppColors().black)),
                                        Row(
                                          children: [
                                            Text("2",
                                                // controller
                                                //     .cartModel[index].itemRate,
                                                style: TextStyle(
                                                    color:
                                                        AppColors().darkGrey)),
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
                                                // "${controller.cartModel[index].itemPrice} \$",
                                                "\$",
                                                style: TextStyle(
                                                    color: AppColors().lRed,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)),
                                            Container(
                                              alignment: Alignment.bottomRight,
                                              child: IconButton(
                                                  onPressed: () {
                                                    // controller.delete(
                                                    //     controller
                                                    //         .cartModel[
                                                    //             index]
                                                    //         .favoriteItemsId);
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
      ),
    );
  }
}
