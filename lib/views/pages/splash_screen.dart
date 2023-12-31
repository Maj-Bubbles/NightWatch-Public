import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:nightwatch/init.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/views/widgets/app_progress_indicator.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      (() {
        InitApp.initializeApp(context);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('media/Splash_GitHub_Page.png'),
              height: 200,
            ),
            const Text.rich(
              TextSpan(
                text: 'Night',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 22,
                  letterSpacing: 5,
                ),
                children: [
                  TextSpan(
                    text: 'Watch',
                    style: TextStyle(
                      color: redButtonColor,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBoxH30(),
            const SizedBoxH30(),
            LoadingBouncingGrid.square(
              backgroundColor: orangePeelForIconsAndButtons,
              size: 150,
            ),
            const SizedBoxH30(),
            const SizedBoxH30(),
            const Text(
              'Loading...',
              style: TextStyle(
                color: silverSandForFormsAndOtherStuff,
                fontSize: 14,
              ),
            ),
            const SizedBoxH30(),
            // IconButton(
            //   onPressed: () {
            //     navigatorService.navigateTo(RouteManager.onBoardingPage);
            //   },
            //   icon: const Icon(
            //     Icons.arrow_forward_ios,
            //     color: silverSandForFormsAndOtherStuff,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
