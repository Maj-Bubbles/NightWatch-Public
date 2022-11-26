import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
//File created by Mr Botes for use in his parts in widget and UI creation

const Map<String, Color> appColors = {
  //Usage: When giving type <Color>, provide as: appColors['Silver']!
  'Silver': Color(0xFFC4CCCB),
  'Red': Color(0xFFFC2108),
  'Orange': Color(0xFFFBA00A),
  'Green': Color(0xFF196E60),
  'Blue': Color(0xFF3AA4FF),
  'Black': Color(0xFF030303)
};

class ImageLibrary {
  static const String aggravatedAssault = 'media/aggravated_assault.png';
  static const String arson = 'media/arson.png';
  static const String assault = 'media/assault.png';
  static const String breakingAndEntering = 'media/breaking_and_entering.png';
  static const String dui = 'media/dui.png';
  static const String kidnapping = 'media/kidnapping.png';
  static const String propertyCrime = 'media/property_crime.png';
  static const String weaponDischarge = 'media/weapon_discharge.png';

  static const String splashGithubPage = 'media/Splash_GitHub_Page.png';

  static const String acknowledged = 'media/acknowledged.png';
  static const String emergencyCall = 'media/emergency-call.png';
  static const String report = 'media/report.png';
}

final enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: appColors['Silver']!,
    // color: Color(0xFFC4CCCB),
    width: 1,
  ),
  borderRadius: BorderRadius.zero,
);

final focussedBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: appColors['Black']!,
    width: 2,
  ),
  borderRadius: BorderRadius.zero,
);

final errorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: appColors['Red']!,
    width: 1,
  ),
  borderRadius: BorderRadius.zero,
);

final focussedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: appColors['Red']!,
    width: 2,
  ),
  borderRadius: BorderRadius.zero,
);

final enabledBorderUnder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: appColors['Silver']!,
    // color: Color(0xFFC4CCCB),
    width: 1,
  ),
  borderRadius: BorderRadius.zero,
);

final focussedBorderUnder = UnderlineInputBorder(
  borderSide: BorderSide(
      color: appColors['Silver']!, width: 2, style: BorderStyle.solid),
  borderRadius: BorderRadius.zero,
);

final errorBorderUnder = UnderlineInputBorder(
  borderSide:
      BorderSide(color: appColors['Red']!, width: 1, style: BorderStyle.solid),
  borderRadius: BorderRadius.zero,
);

final focussedErrorBorderUnder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: appColors['Red']!,
    width: 2,
  ),
  borderRadius: BorderRadius.zero,
);

InputDecoration formDecoration(String labelText) {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0xFFC4CCCB),
    enabledBorder: enabledBorder,
    focusedBorder: focussedBorder,
    errorBorder: errorBorder,
    focusedErrorBorder: focussedErrorBorder,
    labelText: labelText,
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      // color: Color(0xFF030303),
    ),
    errorStyle: TextStyle(
      color: appColors['Red'],
      fontSize: 10,
    ),
    errorMaxLines: 3,
  );
}

InputDecoration formDecorationUnder(String labelText, Icon icon) {
  return InputDecoration(
      filled: false,
      fillColor: const Color(0xFFC4CCCB),
      enabledBorder: enabledBorderUnder,
      focusedBorder: focussedBorderUnder,
      errorBorder: errorBorderUnder,
      focusedErrorBorder: focussedErrorBorderUnder,
      hintText: labelText,
      hintStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        // color: Color(0xFF030303),
      ),
      errorStyle: TextStyle(
        color: appColors['Red'],
        fontSize: 10,
      ),
      errorMaxLines: 3,
      prefixIcon: icon);
}

InputDecoration formDropdownDecoration(String labelText) {
  return InputDecoration(
    enabledBorder: enabledBorder,
    errorBorder: errorBorder,
    focusedErrorBorder: focussedErrorBorder,
    labelText: labelText,
    labelStyle: TextStyle(
      color: appColors['Black']!,
    ),
    errorStyle: TextStyle(
      color: appColors['Red']!,
      fontSize: 10,
    ),
    errorMaxLines: 3,
  );
}
