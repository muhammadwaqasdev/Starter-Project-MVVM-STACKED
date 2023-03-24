import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

extension UIExt on BuildContext {
  double topSpace() => MediaQuery.of(this).padding.top;
  double appBarHeight() => AppBar().preferredSize.height;
  Size screenSize() => MediaQuery.of(this).size;
  ThemeData appTheme() => Theme.of(this);
  TextTheme appTextTheme() => Theme.of(this).textTheme;

  void closeKeyboardIfOpen() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }

  void customErrorSnack(String msg, {String? title}) {
    CherryToast.error(
            title: Text(title ?? "Error"), description: Text(msg.toString()))
        .show(this);
  }

  void customSuccessSnack(String msg, {String? title}) {
    CherryToast.success(
            title: Text(title ?? "Congrats"), description: Text(msg.toString()))
        .show(this);
  }

  void customWarningSnack(String msg, {String? title}) {
    CherryToast.warning(
            title: Text(title ?? "Warning"), description: Text(msg.toString()))
        .show(this);
  }
}
