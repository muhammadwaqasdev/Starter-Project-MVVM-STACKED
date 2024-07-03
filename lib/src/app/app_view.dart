import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter/src/base/utils/constants.dart';
import 'package:starter/src/configs/go_router.dart';
import 'package:starter/src/styles/app_colors.dart';

class AppView extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          return MaterialApp.router(
            title: Constants.appTitle,
            debugShowCheckedModeBanner: false,
            routerConfig: NewGoRoute.router,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                useMaterial3: true,
                colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary: AppColors.primary,
                    onPrimary: AppColors.white,
                    secondary: AppColors.secondary,
                    onSecondary: AppColors.white,
                    error: AppColors.red,
                    onError: AppColors.white,
                    background: AppColors.white,
                    onBackground: AppColors.white,
                    surface: AppColors.white,
                    onSurface: AppColors.primary),
                fontFamily: 'Poppins'),
            builder: (context, child) {
              return Stack(
                children: [child!],
              );
            },
          );
        });
  }
}
