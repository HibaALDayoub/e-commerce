import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../../core/constant/colors/app_colors.dart';

focusOnImage({required String image ,bool isFileImage=false}) {
  Get.dialog(Material(
    child: Stack(
      alignment: Alignment.topLeft,
      children: [
        PhotoView(
          imageProvider:!isFileImage? CachedNetworkImageProvider(image):FileImage(File(image))as ImageProvider,
          initialScale: PhotoViewComputedScale.contained,
          minScale: PhotoViewComputedScale.contained,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
              Icons.arrow_back_ios_rounded,
                color: AppColors().white,
              )),
        )
      ],
    ),
  ));
}
