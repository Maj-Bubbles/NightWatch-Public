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
      color: scaffoldBackgroundColor,
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
