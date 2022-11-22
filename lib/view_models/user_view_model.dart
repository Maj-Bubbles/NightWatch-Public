import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/models/admin_user.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/repositories.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/base_view_model.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class UserViewModel extends BaseViewModel {
  late UserServiceRepo _userService;
  late BackendlessUser _currentUser;
  bool createAdmin = false;
  bool confirmTcsCs = false;
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
        'Jan Cilliers Park',
    'Seemeeu Park',
    'Koppie Alleen',
  ].map<DropdownMenuItem<String>>((item) {
    return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }).toList();

  UserServiceRepo get userService => _userService;
  BackendlessUser get currentUser => _currentUser;
  String _selectedValue = '';
  String get selectedValue => _selectedValue;
  set selectedValue(String param) {
    _selectedValue = param;
    notifyListeners();
  }

  UserViewModel(UserService userService) {
    _userService = userService;
    _currentUser = BackendlessUser();
  }

  registerUserHelper({
    required String email,
    required String name,
    required String userName,
    required String emailAdd,
    required String password,
    required bool isAdmin,
    required String primaryNumber,
    required String secondaryNumber,
    required String region,
    required String cellNum,
    required String emergencyNum,
    String tellNum = "",
    String adminCellNum = "",
  }) async {
    if ((registerFormKey.currentState?.validate() ?? false) && confirmTcsCs) {
      var user;
      if (!createAdmin) {
        user = PublicUser(
          emailAdd: email,
          isAdmin: isAdmin,
          name: name,
          password: password,
          primaryNumber: primaryNumber,
          region: Region(name: region),
          secondaryNumber: secondaryNumber,
          userName: userName,
          cellNum: cellNum,
          emergencyNum: emergencyNum,
        );
      }
      user = AdminUser(
          tellNum: tellNum,
          adminCellNum: adminCellNum,
          name: name,
          userName: userName,
          isAdmin: isAdmin,
          emailAdd: emailAdd,
          region: Region(name: region),
          password: password,
          primaryNumber: primaryNumber,
          secondaryNumber: secondaryNumber);
      await registerUser(user);
    } else if (!confirmTcsCs) {
      setCustomDialog(
          title: "Confirm Tc's and C's",
          message:
              'Please confirm our Terms and Conditions before signing up.');
      setState(ViewState.Error);
    }
  }

  Future<void> registerUser(User user) async {
    try {
      setState(ViewState.Busy);
      _currentUser = await _userService.registerUser(user);
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setErrorDialog(error);
      setState(ViewState.Error);
    }
  }

  Future<void> signInUser(
      {required String email, required String password}) async {
    try {
      if (loginFormKey.currentState?.validate() ?? false) {
        setState(ViewState.Busy);
        _currentUser =
            await _userService.signInUser(email: email, password: password);
        setState(ViewState.Success);
      }

      // if (email.isEmpty || password.isEmpty) {
      //   setCustomDialog(
      //       title: 'Blank fields not allowed.',
      //       message: 'Please fill in both fields!');
      //   setState(ViewState.Error);
      // } else {
      //   setState(ViewState.Busy);
      //   _currentUser =
      //       await _userService.signInUser(email: email, password: password);
      //   setState(ViewState.Success);
      // }
    } on UserAPIException catch (error) {
      setErrorDialog(error);
      setState(ViewState.Error);
    }
  }

  Future<void> logoutUser() async {
    try {
      setState(ViewState.Busy);
      await _userService.logoutUser();
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setErrorDialog(error);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      setState(ViewState.Busy);
      await _userService.resetPassword(email: email);
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setState(ViewState.Error);
      setErrorDialog(error);
    }
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    try {
      bool check = false;
      BackendlessUser? userParam = await _userService.checkIfUserLogged();
      if (userParam != null) {
        _currentUser = userParam;
        check = true;
        return check;
      } else {
        return check;
      }
    } on UserAPIException catch (error) {
      setState(ViewState.Error);
      setErrorDialog(error);
    }
    return false;
  }

  Future<bool> checkIfUserExists(String email) async {
    try {
      return await _userService.checkIfUserExists(email: email);
    } on UserAPIException catch (error) {
      setState(ViewState.Error);
      setErrorDialog(error);
    }
    return false;
  }

  Future<bool> checkIfUserIsAdmin() async {
    try {
      return await _userService.checkIfUserIsAdmin();
    } on UserAPIException catch (error) {
      setState(ViewState.Error);
      setErrorDialog(error);
    }
    return false;
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
