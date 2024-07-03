import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/generated/assets.dart';
import 'package:starter/src/base/utils/utils.dart';
import 'package:starter/src/styles/app_colors.dart';

import 'splash_view_model.dart';

class SplashView extends StackedView<SplashViewModel> {
  @override
  Widget builder(BuildContext context, SplashViewModel model, Widget? child) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        width: context.screenSize().width,
        height: context.screenSize().height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesPlaceholder250),),
        ),
        child: Center(child: Image.asset(Assets.imagesPlaceholder250, width: context.screenSize().width / 2,)),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel model) => model.init();
}
