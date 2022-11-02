import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/services.dart';
import 'package:nightwatch/models/models.dart';

/// [BackendlessUserApi] exposes all necessary apis for user
/// management
///
/// The following api implementation is inspired by Backendless'
/// documentation of the UserService API
/// found here: https://backendless.com/docs/flutter/users_overview.html
class BackendlessUserApi {

  static Future<BackendlessUser?> register(BackendlessUser user) async {
    return Backendless.userService.register(user).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "Register"),
        test: (e) => e is PlatformException);
  }

  static Future<bool?> isValidLogin() async {
    return Backendless.userService.isValidLogin().catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "isValidLogin"),
    test: (e) => e is PlatformException);
  }

  static Future<BackendlessUser?> login(User user) async {
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

  static Future<void> logout() async {
    return Backendless.userService.logout().catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "Logout"),
        test: (e) => e is PlatformException);
  }

  static Future<void> resetPassword(User user) async {
    return Backendless.userService.restorePassword(user.email).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "ResetPassword"),
        test: (e) => e is PlatformException);
  }

  static Future<BackendlessUser?> getCurrentUser() async {
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
  static Future<BackendlessUser?> loginAsGuest() async {
    return Backendless.userService.loginAsGuest(false).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "LoginAsGuest"),
        test: (e) => e is PlatformException);
  }

  /// [updateProperty] Updates a User's attributes such as UserName
  /// region, primary and secondary numbers.
  ///
  /// Argument(s):
  /// user - A Backendless based user object to update.
  ///
  /// Returns: A Future with the Updated Record
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
  static Future<BackendlessUser?> updateProperty(BackendlessUser user) async {
    return Backendless.userService.update(user).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "UpdateProperty"),
        test: (e) => e is PlatformException);
  }

  /// [_handleError] logs an error to the console and throws
  /// an exception to be handled by the API user
  ///
  /// Argument(s):
  /// error - The Api returns a PlatformException that
  ///         signifies an error status from a
  ///         Backendless API operation
  ///
  /// stackTrack - Technical details of the stack when
  ///              the error occurred
  ///
  /// Returns: dynamic, (derived Future's return type)
  ///
  static _handleError(PlatformException error, StackTrace stackTrace,
      {required String apiName}) {
    _logException(error, stackTrace, apiName);
    throw BackendlessException(error.details, error.code as int);
  }

  /// [_logException] prints debug details of the API call
  ///
  /// Argument(s):
  ///
  /// error - The Api returns a PlatformException that
  ///         is signifies an error status from a
  ///         Backendless API operation
  ///
  /// stackTrace - Technical details of the stack when
  ///         the error occurred
  ///
  /// apiName - The name of the calling Function, for ease
  ///           of debugging.
  ///
  /// Returns: void
  ///
  static void _logException(
      PlatformException error, StackTrace stackTrace, String apiName) {
    print("Backendless API Error: $apiName");
    print("exception code: ${error.code}");
    print("exception details: ${error.details}");
    print("stacktrace: $stackTrace");
  }
}
