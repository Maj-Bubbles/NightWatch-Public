import 'package:flutter/material.dart';

enum selectedLang {
  english,
  afrikaans,
}

class LangLogic with ChangeNotifier {
  String _selectedLang = 'English';
  set selectedLang(String text) => _selectedLang = text;
  String get selectedLang => _selectedLang;
}

class LanguageOptionEng {
  //login page

  //UI elements
  static const loginT = 'Login';
  static const loginHintT = 'Sign in to Continue:';

  //textboxes
  static const emailAddressT = 'Email Address';
  static const passwordT = 'Password';

  //buttons
  static const forgotPassB = 'Forgot Password?';
  static const signInB = 'Sign In';
  static const dontAccountB = "Don't have an account?";
}

class LanguageOptionAfr {
  //login page

  //UI elements
  static const loginT = 'Sleutel in';
  static const loginHintT = 'Sleutel asseblief U besonderhede in:';

  //textboxes
  static const emailAddressT = 'Email Adres';
  static const passwordT = 'Wagwoord';

  //buttons
  static const forgotPassB = 'Wagwoord vergeet?';
  static const signInB = 'Sleutel in';
  static const dontAccountB = "Het U nie n rekening?";
}
