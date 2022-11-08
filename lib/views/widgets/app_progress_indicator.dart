import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: silverSandForFormsAndOtherStuff,
    );
  }
}
