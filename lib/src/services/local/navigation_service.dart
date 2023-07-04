import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_app/src/configs/go_router.dart';

class NavService {
  static void splash(BuildContext ctx, {dynamic extra}) =>
      ctx.go(NewGoRoute.splashView, extra: extra);
}
