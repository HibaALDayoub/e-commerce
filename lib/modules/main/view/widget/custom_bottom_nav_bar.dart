import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:e_comerce/modules/main/controller/main_page_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../favorite/controller/favorite_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageControllerImp>(
      builder: (controller) => BottomNavigationBar(
          onTap: (value) {
            controller.selected = value;
            controller.update();
            // print(controller.selected);
            if (controller.selected == 1) {
              FavoriteController favController = Get.find();
              favController.getFavData();
              print("controller_selected is :${controller.selected}");
            }
          },
          currentIndex: controller.selected,
          unselectedItemColor: AppColors.deepGrey,
          selectedFontSize: 17,
          selectedItemColor: Colors.red[400],
          selectedLabelStyle: TextStyle(color: Colors.red[400]),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: ""),
          ]),
    );
  }
}
