import 'package:flutter/material.dart';
import 'sub_colors/gradient_colors.dart';
import 'sub_colors/grey_levels_color.dart';
import 'sub_colors/main_colors.dart';

class AppColors with MainColorsMixin, GradientColors, GreyLevelsColorMixin {
  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Color(0xff616161);
  static const Color backColorLight = Color(0xFFf8f8f8);
  static const Color orange = Color(0xFFfb825c);

  static const Color mostLightGrey = Color(0xFFf1f2f6);
  static const Color veryLightGrey = Color(0xffedeef1);

  static const Color deepGrey = Color(0xFF8f8f8f);
  static const Color deepOrange = Color(0xFFf77547);

  static const Color pinkred = Color(0xFFf88a9b);
  static const Color pink = Color(0xfffae8dc);
  static const Color yellow = Color(0xfff7cf30);
  static const Color lightPink = Color(0xfff7dfdf);

  static const Color thirdDotColor = Color(0xffd7c599);

  static const Color darkPink = Color(0xFFe37fa0);
  static const Color cyan = Color(0xFF099688);
  static const Color blue = Color(0x80678afc);
// M Stands for Main
// S Stands for Side
// C Stands for Dot
  static const Color bluePurpleM = Color(0xff49398d);
  static const Color bluePurpleS = Color(0xff615598);
  static const Color bluePurpled = Color(0xff816cb3);
}
