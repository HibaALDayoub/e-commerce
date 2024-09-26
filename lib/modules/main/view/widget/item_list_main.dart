import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../../shared/widgets/images/custom_cached_net_image.dart';

class ItemListMain extends StatelessWidget {
  final String imgUrlItem;
  final String nameItem;
  const ItemListMain(
      {super.key, required this.imgUrlItem, required this.nameItem});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 80,
        width: AppSize.screenWidth(context: context) * 0.4,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: AppColors.backColorLight,
            borderRadius: BorderRadius.circular(20)),
        child: CustomCachedNetImage(
            height: 80,
            width: AppSize.screenWidth(context: context) * 0.4,
            fit: BoxFit.cover,
            imageUrl: imgUrlItem),
      ),
      Container(
        height: 80,
        width: AppSize.screenWidth(context: context) * 0.4,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          gradient: AppColors().brownLinearGradient,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(nameItem),
          ],
        ),
      )
    ]);
  }
}
