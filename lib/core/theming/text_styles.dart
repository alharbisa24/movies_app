import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theming/font_weights.dart';

class AppTextStyles {
  static TextStyle get _baseStyle => GoogleFonts.tajawal();

  static TextStyle heading1({Color? color}) => _baseStyle.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeights.bold,
    color: color,
  );

  static TextStyle heading2({Color? color}) => _baseStyle.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeights.bold,
    color: color,
  );

  static TextStyle heading3({Color? color}) => _baseStyle.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeights.bold,
    color: color,
  );

  static TextStyle heading4({Color? color}) => _baseStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeights.bold,
    color: color,
  );


  static TextStyle body1({Color? color}) => _baseStyle.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeights.regular,
    color: color,
  );

  static TextStyle body2({Color? color}) => _baseStyle.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeights.regular,
    color: color,
  );
    static TextStyle body3({Color? color}) => _baseStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeights.regular,
    color: color,
  );
    static TextStyle body4({Color? color}) => _baseStyle.copyWith(
    fontSize: 10.sp,
    fontWeight: FontWeights.regular,
    color: color,
  );

  static TextStyle caption({Color? color}) => _baseStyle.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeights.regular,
    color: color,
  );

  static TextStyle custom({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) => _baseStyle.copyWith(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
  );
}
