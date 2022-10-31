import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/services.dart';
import 'package:nightwatch/models/models.dart';

/// The following api implementation is inspired by Backendless'
/// documentation of the UserService API
/// found here: https://backendless.com/docs/flutter/users_overview.html
class BackendlessUserApi {
  final backendlessApi = Backendless();

  Future<BackendlessUser?> register(BackendlessUser user) {
    return Backendless.userService.register(user).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "Register"),
        test: (e) => e is PlatformException);
  }

  Future<bool?> isValidLogin() {
    return Backendless.userService.isValidLogin().catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "isValidLogin"),
    test: (e) => e is PlatformException);
  }

  Future<BackendlessUser?> login(User user) {
    // stayLoggedIn parameter is best set to true
    // to avoid re-logging the user after first use.
    // see: https://backendless.com/docs/flutter/users_login.html
    return Backendless.userService
        .login(user.email, user.password, true)
        .catchError(
            (error, stackTrace) =>
                _handleError(error, stackTrace, apiName: "Login"),
            test: (e) => e is PlatformException);
  }

  Future<void> logout() {
    return Backendless.userService.logout().catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "Logout"),
        test: (e) => e is PlatformException);
  }

  Future<void> resetPassword(User user) {
    return Backendless.userService.restorePassword(user.email).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "ResetPassword"),
        test: (e) => e is PlatformException);
  }

  Future<BackendlessUser?> getCurrentUser() {
    return Backendless.userService.getCurrentUser().catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "GetCurrentUser"),
        test: (e) => e is PlatformException);
  }

  /// According to Backendless, the process of using anonymous login
  /// consists of the following steps:
  ///
  /// 1. Login the user anonymously using the API documented below;
  /// 2. Perform any application specific logic, such as establishing data object
  /// relationships with the user data record;
  /// 3. Convert the guest user account to a registered user by using
  /// the user registration API[https://backendless.com/docs/flutter/users_user_registration.html].
  ///
  Future<BackendlessUser?> loginAsGuest() {
    return Backendless.userService.loginAsGuest(false).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "LoginAsGuest"),
        test: (e) => e is PlatformException);
  }

  /// Updates a User's attributes such as UserName,region, primary and secondary numbers.
  ///
  /// For more see: https://backendless.com/docs/flutter/users_update_user_properties.html
  ///
  /// Precondition: The BackendlessUser.setProperty attribute must be updated before passing the
  ///               BackendlessUser object to this class.
  ///
  ///               ```dart
  ///               user.setProperty("Primary_Number", 123456789);
  ///               backendlessUserApi.updateProperty(user);
  ///               ```
  Future<BackendlessUser?> updateProperty(BackendlessUser user) {
    return Backendless.userService.update(user).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "UpdateProperty"),
        test: (e) => e is PlatformException);
  }

  /// Code reuse: Handle API Errors and print details to the console
  _handleError(PlatformException error, StackTrace stackTrace,
      {required String apiName}) {
    _logException(error, stackTrace, apiName);
    throw BackendlessException(error.details, error.code as int);
  }

  /// Prints error information of a Backendless API error
  /// to the console for ease of debugging
  void _logException(
      PlatformException error, StackTrace stackTrace, String apiName) {
    print("Backendless API Error: $apiName");
    print("exception code: ${error.code}");
    print("exception details: ${error.details}");
    print("stacktrace: $stackTrace");
  }
}
