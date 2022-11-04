import 'package:flutter/material.dart';

//cOLORS FOR iCONS'S bACKGROUND, cONTAINERS, BUTTONS, SCAFFOLD'S bACKGROUND

const Color redButtonColor = Color.fromRGBO(252, 33, 8, 1.0);

const Color scaffoldBackgroundColor = Color.fromARGB(255, 22, 22, 22);

const Color orangePeelForIconsAndButtons = Color.fromRGBO(251, 160, 10, 1.0);

const Color tropicalForContainerAndButtonColor =
    Color.fromRGBO(25, 110, 96, 1.0);

const Color jeansBlueForIcons = Color.fromRGBO(58, 164, 255, 1.0);

const Color silverSandForFormsAndOtherStuff =
    Color.fromRGBO(183, 193, 192, 1.0);

//cOLORS FOR iCONS AND TEXTS

const TextStyle appBarTitle = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle headingsOne = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle headingsTwo = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle normalTextOne = TextStyle(
  fontSize: 14,
  color: Color.fromRGBO(183, 193, 192, 1.0),
);

const TextStyle normalTextTwo = TextStyle(
  fontSize: 14,
  color: Color.fromARGB(255, 22, 22, 22),
);

class SizedBoxH10 extends StatelessWidget {
  const SizedBoxH10({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class SizedBoxH20 extends StatelessWidget {
  const SizedBoxH20({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class SizedBoxH30 extends StatelessWidget {
  const SizedBoxH30({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }
}
