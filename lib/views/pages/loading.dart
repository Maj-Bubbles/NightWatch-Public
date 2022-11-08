import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/locator_service.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/views/widgets/app_progress_indicator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('lib/media/Splash_original.png'),
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
            const AppProgressIndicator(),
            const SizedBoxH30(),
            const SizedBoxH30(),
            const Text(
              'Loading ...',
              style: TextStyle(
                color: silverSandForFormsAndOtherStuff,
                fontSize: 14,
              ),
            ),
            const SizedBoxH30(),
            IconButton(
              onPressed: () {
                locator
                    .get<NavigationAndDialogService>()
                    .navigateTo(RouteManager.onBoardingPage);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: silverSandForFormsAndOtherStuff,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
