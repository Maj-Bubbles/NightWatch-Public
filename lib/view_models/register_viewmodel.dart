import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  bool createAdmin = false;
  bool confirmTcsCs = false;
  // String primaryNumAlloc = 'Cellphone Number';
  // String secondaryNumberAlloc = 'Emergency Number';
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final List<DropdownMenuItem<String>> items = [
    'Welkom',
    'Riebeeckstad',
    'Naudeville',
    'St Helena',
    'Bedelia',
    'Reitzpark',
    'Doorn',
    'Flamingo Park',
    'Dagbreek',
    'Virginia',
    'Harmony',
    'Saaiplaas',
    'Merriespruit',
    'Panorama',
    'Kitty',
    'Meloding',
    'Thabong'
  ].map<DropdownMenuItem<String>>((item) {
    return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }).toList();

/*
Jan Cilliers Park
Seemeeu Park
Koppie Alleen

*/

  String _selectedValue = '';
  String get selectedValue => _selectedValue;
  set selectedValue(String param) {
    _selectedValue = param;
    notifyListeners();
  }

  void checkCreateAdmin() {
    // if (primaryNumAlloc.contains('Cellphone Number')) {
    //   primaryNumAlloc = 'Company Telephone';
    // } else {
    //   primaryNumAlloc = 'Cellphone Number';
    // }
    // if (secondaryNumberAlloc.contains('Emergency Number')) {
    //   primaryNumAlloc = 'Admin Cellphone Number';
    // } else {
    //   primaryNumAlloc = 'Emergency Number';
    // }
    createAdmin = !createAdmin;
    notifyListeners();
  }

  void checkConfirmedTcsAndCs() {
    confirmTcsCs = !confirmTcsCs;
    notifyListeners();
  }
}
