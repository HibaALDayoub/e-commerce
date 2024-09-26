import 'package:flutter/material.dart';
import '../../constant/assets/app_assets.dart';
import '../../constant/colors/app_colors.dart';

AppColors appColors = AppColors();
TextStyle displaySmallLight() {
  return  TextStyle(
      color: appColors.black, fontSize: 12, fontWeight: FontWeight.w400,fontFamily: AppAssets().poppins);
}

TextStyle displayMediumLight() {
  return  TextStyle(
      color: appColors.black, fontSize: 16, fontWeight: FontWeight.w500,fontFamily: AppAssets().poppins);
}

TextStyle displayLargeLight() {
  return  TextStyle(
      color: appColors.black, fontSize: 20, fontWeight: FontWeight.bold,fontFamily: AppAssets().poppins);
}
