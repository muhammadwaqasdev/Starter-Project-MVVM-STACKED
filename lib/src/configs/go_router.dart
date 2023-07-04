import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_app/src/views/splash/splash_view.dart';

class NewGoRoute {
  static const splashView = '/';

  static GoRouter router = GoRouter(
    initialLocation: NewGoRoute.splashView,
    routes: [
      GoRoute(
        name: "Splash",
        path: NewGoRoute.splashView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: SplashView(),
          );
        },
      ),
    ],
  );
}

class LoginViewExtra {
  const LoginViewExtra({required this.type});

  final String type;
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.elasticOut);
}
