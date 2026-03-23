import 'dart:io' show Platform;
import 'package:caretosharemobile/presentation/auth/signin.dart';
import 'package:caretosharemobile/presentation/auth/signup.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:caretosharemobile/splashView.dart';

class Routes {
  static const initialRoute = AppRoutes.splashView;

  static Route buildPageRoute(Widget page, String routeName) {
    return Platform.isAndroid
        ? PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          settings: RouteSettings(name: routeName),
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        )
        : CupertinoPageRoute(
          builder: (context) => page,
          settings: RouteSettings(name: routeName),
        );
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.splashView => buildPageRoute(
        const SplashView(),
        settings.name!,
      ),
      AppRoutes.signinView => buildPageRoute(
        const SignInView(),
        settings.name!,
      ),
      AppRoutes.signupView => buildPageRoute(
        const SignUpView(),
        settings.name!,
      ),
      _ => null,
    };
  }
}

abstract class AppRoutes {
  static const splashView = '/splash-view';
  static const signinView = '/signin-view';
  static const signupView = '/signup-view';
}
