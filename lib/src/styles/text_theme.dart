import 'package:flutter/material.dart';
import 'package:starter_app/src/styles/app_colors.dart';

class TextStyling {
  TextStyling._();

  static TextStyle extraLargeBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.black,
  );
  static TextStyle extraLargeRegular = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 26,
    color: AppColors.black,
  );
  static TextStyle largeBold = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.black);
  static TextStyle largeRegular = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.black);
  static TextStyle mediumBold = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.black);
  static TextStyle mediumRegular = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.black);
  static TextStyle smallBold = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.black);
  static TextStyle smallRegular = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.black);
  static TextStyle extraSmallBold = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 8, color: AppColors.black);
  static TextStyle extraSmallRegular = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 8, color: AppColors.black);

}
