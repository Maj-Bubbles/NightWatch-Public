import 'package:flutter/material.dart';
import 'package:nightwatch/init.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/locator_service.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitApp.initializeApp();
  setupLocator();
  runApp(
    const NightWatchApp(),
  );
}

class NightWatchApp extends StatelessWidget {
  const NightWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteManager.onGenerateRoute,
      initialRoute: RouteManager.loginPage,
    );
  }
}
