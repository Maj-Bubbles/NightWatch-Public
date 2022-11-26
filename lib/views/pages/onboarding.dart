import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

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
                'The easiest way to report.\n\n- Click 3 times on the report button. \n- Then, select to file a normal or an imminent report. \n    - The Imminent report is for people who suspect they might be in danger at a given time.\n      - Normal reports could be of an incident that is happening or has already happened.',
            pathImage: 'media/report.png',
          ),
          ContentConfig(
            title: "Acknowledge",
            description:
                'For every report that gets made, the officials (SAPS/Security), will receive the report and give assurance to the community. \nThey will be able indicate that they have received the message by clicking on the acknowledge button on the reports page. \nThe person that made the report will receive a notification after they have acknowledged the report.',
            pathImage: 'media/acknowledged.png',
          ),
          ContentConfig(
            title: "Emergency",
            description:
                'A list of emergency numbers can be found by clicking on the Emergency Button on the login page, and on the reports page.',
            pathImage: 'media/emergency-call.png',
          )
        ],
        onDonePress: () {
          Navigator.of(context).pop();
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