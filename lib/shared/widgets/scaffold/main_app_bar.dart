import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constant/colors/app_colors.dart';

AppBar mainAppBar({
  required BuildContext context,
  SystemUiOverlayStyle? systemOverlayStyle,
  required GlobalKey<ScaffoldState> scaffoldKey,
  List<Widget>? actions,
}) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: true,
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {
            // ProfileController profileController = Get.find();
            // profileController.getData();
            // Get.toNamed(AppRoutes().profileRoute);
          },
          icon: Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors().white.withOpacity(0.8))),
            child: const Icon(Icons.person),
          )),
      GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors().white.withOpacity(0.8))),
            child: Text(
              "EN",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors().white.withOpacity(0.8)),
            ),
          )),
      IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: AppColors().white,
          )),
    ],
  );
}
