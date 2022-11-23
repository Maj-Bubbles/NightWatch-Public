import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/init.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitApp.initializeApp();
  runApp(
    const NightWatchApp(),
  );
}

class NightWatchApp extends StatelessWidget {
  const NightWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(UserService(BackendlessUserApi())),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportsViewModel(
            ReportsService(
              databaseApi: BackendlessDatabaseApi(),
              realTimeAPI: BackendlessRealTimeAPI(
                reportsHandler: EventHandler("Report"),
              ),
            ),
          ),
        ),
        Provider(
          create: (context) => NavigationAndDialogService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: RouteManager.onGenerateRoute,
        initialRoute: RouteManager.userRepotsFeedPage,
      ),
    );
  }
}
