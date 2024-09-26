import 'package:flutter/material.dart';

import '../../constant/assets/app_assets.dart';
import '../../constant/colors/app_colors.dart';

AppColors appColors = AppColors();

TextStyle displaySmallDark() {
  return TextStyle(
      color: appColors.black, fontSize: 12, fontWeight: FontWeight.w400,fontFamily: AppAssets().poppins);
}

TextStyle displayMediumDark() {
  return TextStyle(
      color: appColors.black, fontSize: 16, fontWeight: FontWeight.w500,fontFamily: AppAssets().poppins);
}

TextStyle displayLargeDark() {
  return TextStyle(
      color: appColors.black, fontSize: 20, fontWeight: FontWeight.w600,fontFamily: AppAssets().poppins);
}
