import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_screens/ui/constants/_constants.dart';

class AppTextStyles {
  static TextStyle kTextStyle(
    double size, {
    Color? color,
    FontWeight? weight,
    double? height,
    double? spacing,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size.sm,
      color: color ?? AppColors.black,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  static TextStyle heading1 = TextStyle(
    fontSize: 40.sm,
    color: AppColors.grey,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 1,
  );
  static TextStyle heading3 = TextStyle(
    fontSize: 28.sm,
    color: AppColors.grey,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    height: 1.14,
  );
  static TextStyle regularBody = TextStyle(
    fontSize: 16.sm,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle bold12 = TextStyle(
    fontSize: 12.sm,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static TextStyle medium14 = TextStyle(
    fontSize: 14.sm,
    color: AppColors.black,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
}
