import 'package:e_comerce/core/routes/routes_imports.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../shared/widgets/images/custom_cached_net_image.dart';

class ListCategoriesAndPopularMain extends StatelessWidget {
  final String imageUrlCategories;
  final double? height;
  final double? width;
  final Color? colorContainer;
  final BorderRadiusGeometry? borderRadius;
  final categoryName;
  final void Function()? onTap;

  const ListCategoriesAndPopularMain(
      {super.key,
      required this.imageUrlCategories,
      this.categoryName,
      this.height,
      this.width,
      this.colorContainer,
      this.borderRadius,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: height ?? 80,
            width: width ?? 80,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: colorContainer ?? AppColors.orange.withOpacity(0.2),
                borderRadius: borderRadius ?? BorderRadius.circular(6)),
            child: CustomCachedNetImage(
                height: 80, fit: BoxFit.contain, imageUrl: imageUrlCategories),
          ),
        ),
        Text(
          categoryName ?? "",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
