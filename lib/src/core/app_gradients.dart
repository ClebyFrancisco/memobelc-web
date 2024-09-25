import 'dart:math';
import 'package:memobelc_front/src/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(
      colors: [AppColors.primary, AppColors.primary],
      stops: [0.0, 0.695],
      transform: GradientRotation(2.13959913 * pi));
}