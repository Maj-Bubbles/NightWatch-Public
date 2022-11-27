import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/init.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            create: (context) => ReportsViewModel(FirebaseReportsService(
                firebaseFirestore: FirebaseFirestore.instance,
                firebaseStorage: FirebaseStorage.instance))),
        Provider(
          create: (context) => NavigationAndDialogService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: RouteManager.onGenerateRoute,
        initialRoute: RouteManager.splashScreen,
      ),
    );
  }
}
