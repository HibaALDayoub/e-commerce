import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors/app_colors.dart';
import '../../shared/widgets/loading/loading_points.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
    this.color,
    this.radius,
    this.onTap,
    this.isLoading = false,
  });
  final Color? color;
  final double? radius;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.back();
          },
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundColor: color ?? AppColors().red.withOpacity(0.7),
        child: isLoading
            ? const LoadingPoint()
            :  Center(
                child: Icon(
                  Icons.close,
                  color: AppColors().white,
                ),
              ),
      ),
    );
  }
}
