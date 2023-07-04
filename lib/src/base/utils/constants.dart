import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starter_app/src/styles/app_colors.dart';
import 'package:starter_app/src/styles/text_theme.dart';

class Constants {
  Constants._();

  static String get appTitle => "Flutter Starter App";

  static customErrorSnack(String? msg, {String? title}) {
    Get.snackbar(
      title ?? "Error",
      msg ?? "Error",
      titleText: Text(
        title ?? "Error",
        style: TextStyling.semiBold
            .copyWith(color: AppColors.red, fontSize: 14.sp),
      ),
      messageText: Text(
        msg.toString(),
        style:
            TextStyling.regular.copyWith(color: AppColors.red, fontSize: 12.sp),
      ),
      backgroundColor: AppColors.white.withOpacity(0.4),
      duration: Duration(seconds: 6),
      icon: Icon(
        Icons.error,
        color: AppColors.red,
        size: 30,
      ),
    );
  }

  static customSuccessSnack(String? msg, {String? title}) {
    Get.snackbar(
      title ?? "Congrats",
      msg ?? "Congrats",
      titleText: Text(
        title ?? "Congrats",
        style: TextStyling.semiBold
            .copyWith(color: AppColors.green, fontSize: 14.sp),
      ),
      messageText: Text(
        msg.toString(),
        style: TextStyling.regular
            .copyWith(color: AppColors.green, fontSize: 12.sp),
      ),
      backgroundColor: AppColors.white.withOpacity(0.4),
      duration: Duration(seconds: 6),
      icon: Icon(
        Icons.done,
        color: AppColors.green,
        size: 30,
      ),
    );
  }

  static customWarningSnack(String? msg, {String? title}) {
    Get.snackbar(
      title ?? "Warning",
      msg ?? "Warning",
      titleText: Text(
        title ?? "Warning",
        style: TextStyling.semiBold
            .copyWith(color: Colors.orange, fontSize: 14.sp),
      ),
      messageText: Text(
        msg.toString(),
        style:
            TextStyling.regular.copyWith(color: Colors.orange, fontSize: 12.sp),
      ),
      backgroundColor: AppColors.white.withOpacity(0.4),
      duration: Duration(seconds: 6),
      icon: Icon(
        CupertinoIcons.info,
        color: Colors.orange,
        size: 30,
      ),
    );
  }
}
