import 'package:flutter/material.dart';
import '../../core/constant/colors/app_colors.dart';
import '../../core/helper/localization/localization_helper.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.hintText,
      this.selectedValue,
      required this.itemsList,
      this.onChanged, this.isApiData=false});
  final String hintText;
  final dynamic selectedValue;
  final List<dynamic> itemsList;
  final bool isApiData;
  final void Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(
        hintText,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: AppColors().darkGrey),
      ),
      value: selectedValue,
      isExpanded: true,
      underline: const SizedBox(),
      icon: const SizedBox(
          height: 20,
          width: 20,
          child: Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Icon(Icons.keyboard_arrow_down_outlined),
          )),
      items: itemsList.map<DropdownMenuItem<dynamic>>((value) {
        return DropdownMenuItem<dynamic>(
          value:value,
          child: SizedBox(
            child: Text(isApiData? LocalizationHelper.translate(enText: value.nameEn, arText: value.nameAr):value,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    overflow: TextOverflow.fade,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
