import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/locator_service.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: IntroSlider(
        key: UniqueKey(),
        listContentConfig: const [
          ContentConfig(
            title: "Report",
            description:
                'The easiest way to report.\nClick 3 times on the report button on the reports page.Then, you will presented with two options, whether to file a normal or an imminet report. The Imminent report is for people who suspect they might be in danger at a given time. However, the normal report, it could be of an incident that is happening or has already happened.',
            pathImage: 'media/report.png',
          ),
          ContentConfig(
            title: "Acknowledge",
            description:
                'For every report that gets made, the officials (SAPS/Security), will receive the report and to give assurance to the community, they will be able indicate that they have received the message by clicking on the acknowledge button on the reports page. And, the person that made the report wuill receive a notification after they have acknowledged the report.',
            pathImage: 'media/acknowledged.png',
          ),
          ContentConfig(
            title: "Emergency",
            description:
                'A list of emergency number can be found by clicking on the button on the login page, that is located on the bottom right of the page and on the reports page, at the bottom right.',
            pathImage: 'media/emergency-call-icon.jpg',
          )
        ],
        onDonePress: () {
          locator
              .get<NavigationAndDialogService>()
              .navigateTo(RouteManager.loginPage);
        },
      ),
    );
  }
}





/**
 * SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              color: orangePeelForIconsAndButtons,
              width: 326,
              child: Column(
                children: const [
                  Image(
                    image: AssetImage(
                      'media/report.png',
                    ),
                    height: 300,
                  ),
                  Text(
                    'Heading',
                  ),
                  Text(
                    'Description',
                  ),
                ],
              ),
            ),
            Container(
              color: jeansBlueForIcons,
              width: 326,
              child: Column(
                children: const [
                  Image(
                    image: AssetImage(
                      'media/acknowledged.png',
                    ),
                    height: 300,
                  ),
                  Text(
                    'Heading',
                  ),
                  Text(
                    'Description',
                  ),
                ],
              ),
            ),
            Container(
              color: redButtonColor,
              width: 326,
              child: Column(
                children: const [
                  Image(
                    image: AssetImage(
                      'media/emergency-call-icon.jpg',
                    ),
                    height: 300,
                  ),
                  Text(
                    'Heading',
                  ),
                  Text(
                    'Description',
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 34,
              ),
            ),
          ],
        ),
      ),
 */