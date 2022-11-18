import 'package:flutter/material.dart';
import 'package:nightwatch/views/pages/sign_up.dart';
import 'package:nightwatch/views/pages/splash_screen.dart';
import 'package:nightwatch/views/pages/login_page.dart';
import 'package:nightwatch/views/pages/onboarding.dart';

class RouteManager {
  static const String splashScreen = '/';
  static const String onBoardingPage = '/onBoardingPage';
  static const String loginPage = '/loginPage';
  static const String signUpPage = '/signUpPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const LoadingPage(),
        );

      case onBoardingPage:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );

      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );

      default:
        throw Exception('No route found!');
    }
  }
}
