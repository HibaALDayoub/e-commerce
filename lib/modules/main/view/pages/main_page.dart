import 'package:e_comerce/core/classes/status_request.dart';
import 'package:e_comerce/modules/main/view/widget/custom_app_bar.dart';

import 'package:e_comerce/shared/widgets/handling_api_request/retry_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes_imports.dart';
import '../../../cart/view/pages/cart_page.dart';
import '../../controller/main_page_controller.dart';
import '../widget/custom_bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    // MainPageControllerImp controller = Get.find();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: GetBuilder<MainPageControllerImp>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const Center(child: CircularProgressIndicator())
                  : controller.statusRequest == StatusRequest.failure
                      ? RetryButton(onTap: () {
                          controller.getData();
                        })
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(children: [
                            CustomAppBar_(
                              titleAppBar: "Search Product",
                              onPressedIcon1: () {
                                // _______________________________

                                Get.toNamed(AppRoutes.cartPage);
                                //             arguments: {
                                // "model": controller.categories[ind],
                                // "index": ind
                                // });
                              },
                              onPressedIcon2: () {},
                            ),
                            Expanded(
                                child: ListView(
                              children: [
                                controller.mainWidgets[controller.selected]
                              ],
                            ))
                          ]),
                        ),
          //       //     // widget for اعلان
        ),
      ),
    );
  }
}
// static const String mainRoute = '/main_route';