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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverSandForFormsAndOtherStuff,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: IntroSlider(),
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