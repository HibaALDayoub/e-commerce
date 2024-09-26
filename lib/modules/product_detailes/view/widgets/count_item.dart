import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';

class CountItem extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final int count;
  const CountItem(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      // padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.lightPink,
      ),
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: onRemove,
              icon: Icon(
                Icons.remove,
                color: AppColors().lightGrey,
              )),
          Text(
            "$count",
            style: TextStyle(color: AppColors().lRed),
          ),
          IconButton(
              onPressed: onAdd,
              icon: Icon(
                Icons.add,
                color: AppColors().lightGrey,
              )),
        ],
      ),
    );
  }
}
