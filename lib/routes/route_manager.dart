import 'package:flutter/material.dart';
import 'package:nightwatch/views/pages/login_page.dart';

class RouteManager {
  static const String loginPage = '/';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      default:
        throw Exception('No route found!');
    }
  }
}
