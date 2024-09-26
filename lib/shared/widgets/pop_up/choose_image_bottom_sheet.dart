import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors/app_colors.dart';

openImagePickerBottomSheet(
    {required BuildContext context,
    void Function()? fromGallery,
    void Function()? fromCamera}) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
          color: AppColors().white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25))),
      child: Column(
        children: [
          Text(
            "Choose Image",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 17,color: AppColors().black),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: fromGallery,
              child: Row(
                children: [
                  const Icon(
                    Icons.image,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "From Gallery",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              )),
          TextButton(
              onPressed: fromCamera,
              child: Row(
                children: [
                  const Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "From Camera",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ))
        ],
      ),
    ),
    isScrollControlled: true,
    enableDrag: false,
  );
}
