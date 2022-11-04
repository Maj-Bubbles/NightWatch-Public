import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationAndDialogService {
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> popAndNavigateTo(String routeName) {
    return navigatorKey.currentState!.popAndPushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  void showSnackBar({required String message, required String title}) {
    Flushbar(
      borderRadius: BorderRadius.circular(10),
      backgroundColor: orangePeelForIconsAndButtons,
      title: title,
      message: message,
      titleColor: scaffoldBackgroundColor,
      messageColor: scaffoldBackgroundColor,
      duration: const Duration(milliseconds: 3500),
      flushbarPosition: FlushbarPosition.BOTTOM,
      maxWidth: double.infinity,
      margin: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
    ).show(navigatorKey.currentState!.context);
  }
}
