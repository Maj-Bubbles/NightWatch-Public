import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/repositories.dart';
import 'package:nightwatch/services/services.dart';

class UserViewModel with ChangeNotifier {
  late UserServiceRepo _userService;
  late BackendlessUser _currentUser;
  // The following variables are public because they
  // final thus have no use case for getters and setters
  late final registerFormKey;
  late final loginFormKey;

  UserServiceRepo get userService => _userService;
  BackendlessUser get currentUser => _currentUser;

  UserViewModel() {
    _userService = UserService();
    _currentUser = BackendlessUser();
    registerFormKey = GlobalKey<FormState>();
    loginFormKey = GlobalKey<FormState>();
  }

  void registerUser(User user) {}
  void signInUser(User user) {}
  void logoutUser(User user) {}
  void forgotPassword(User user) {}
  void checkIfUserIsLoggedIn(User user) {}
  void checkIfUserExists(User user) {}
  void checkIfUserIsAdmin(User user) {}
}
