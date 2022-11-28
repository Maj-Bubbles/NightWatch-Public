import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

class LoadingIndicatorV2 extends StatelessWidget {
  const LoadingIndicatorV2({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: SizedBox(
            height: 175,
            width: 300,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      const Image(
                        image: AssetImage('media/Splash_GitHub_Page.png'),
                        height: 75,
                      ),
                      LoadingBouncingGrid.square(
                        backgroundColor: scaffoldBackgroundColor,
                        size: 75,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please wait',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
