import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/base_view_model.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/user_view_model.dart';

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

  void showSnackBar(StatusDialog dialog) {
    Flushbar(
      borderRadius: BorderRadius.circular(10),
      backgroundColor: orangePeelForIconsAndButtons,
      title: dialog.title,
      message: dialog.message,
      titleColor: scaffoldBackgroundColor,
      messageColor: scaffoldBackgroundColor,
      // title: title,
//       message: message,
//       titleColor: Colors.white,
//       messageColor: Colors.white,
// >>>>>>> origin/screens TODO: Check conflict
      duration: const Duration(milliseconds: 3500),
      flushbarPosition: FlushbarPosition.BOTTOM,
      maxWidth: double.infinity,
      margin: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
    ).show(navigatorKey.currentState!.context);
  }
}
