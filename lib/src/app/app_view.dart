import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_app/generated/assets.dart';
import 'package:starter_app/src/base/utils/Constants.dart';
import 'package:starter_app/src/base/utils/utils.dart';
import 'package:starter_app/src/services/local/navigation_service.dart';
import 'package:starter_app/src/shared/spacing.dart';
import 'package:starter_app/src/styles/app_colors.dart';
import 'package:starter_app/src/styles/text_theme.dart';
import 'package:starter_app/src/views/splash/splash_view.dart';

class AppView extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: Constants.appTitle,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: NavService.onGenerateRoute,
              navigatorKey: NavService.key,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  useMaterial3: true,
                  colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColors.primary, onPrimary: AppColors.white, secondary: AppColors.secondary, onSecondary: AppColors.white, error: AppColors.red, onError: AppColors.white, background: AppColors.white, onBackground: AppColors.white, surface: AppColors.white, onSurface: AppColors.primary),
                  fontFamily: 'Poppins'),
              home: SplashView(),
              builder: (context, child) {
                return snapshot.data == ConnectivityResult.none
                    ? NoInternet()
                    : Stack(
                  children: [child!],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenSize().width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesPlaceholder250,
              width: context.screenSize().width * 0.8,
              height: context.screenSize().width * 0.8,
            ),
            VerticalSpacing(15),
            Text(
              "No Internet Found",
              style: TextStyling.largeRegular.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

