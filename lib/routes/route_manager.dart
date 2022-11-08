import 'package:flutter/material.dart';
import 'package:nightwatch/views/pages/loading.dart';
import 'package:nightwatch/views/pages/login_page.dart';
import 'package:nightwatch/views/pages/onboarding.dart';

class RouteManager {
  static const String loadingPage = '/';
  static const String onBoardingPage = '/onBoardingPage';
  static const String loginPage = '/loginPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => const LoadingPage(),
        );

      case onBoardingPage:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );

      case loginPage:
      // return MaterialPageRoute(
      // builder: (context) => const LoginPage(),
      // );

      default:
        throw Exception('No route found!');
    }
  }
}
