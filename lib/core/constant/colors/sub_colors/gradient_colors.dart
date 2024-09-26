import 'package:flutter/material.dart';

mixin GradientColors {
  //Gradient colors
  Gradient get brownLinearGradient => const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.black38,
          Colors.black12,
        ],
      );
}
