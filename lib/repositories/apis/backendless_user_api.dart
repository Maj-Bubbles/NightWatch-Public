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

  /// [register] registers a user
  ///
  /// Argument(s):
  ///
  /// User - Contains state to login the user
  ///
  /// Returns: BackendlessUser object
  ///
  static Future<BackendlessUser?> register(BackendlessUser user) async {
    try {
      return await Backendless.userService.register(user);
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "Register");
    }
  }

  /// [isValidLogin] The login operation provides a way to persist the
  /// user-token on the client side so it can be used when the application is
  /// restarted. This helps in streamlining the user experience since the user
  /// of the application does not need to login again.
  ///
  ///
  /// Returns: True or False
  ///
  static Future<bool?> isValidLogin() async {
    try {
      return await Backendless.userService.isValidLogin();
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "isValidLogin");
    }
    return null;
  }

  /// [login]logins a user
  ///
  /// Argument(s):
  ///
  /// User - Contains state to login the user
  ///
  /// Returns: BackendlessUser object
  ///
  static Future<BackendlessUser?> login({required String email, required String password}) async {
    // stayLoggedIn parameter is best set to true
    // to avoid re-logging the user after first use.
    // see: https://backendless.com/docs/flutter/users_login.html
    try {
      return await Backendless.userService.login(email, password, true);
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "Login");
    }
  }

  /// [logout] logs out a user currently
  /// in the session
  ///
  /// Argument(s):
  ///
  /// Returns: void
  ///
  static Future<void> logout() async {
    try {
      Backendless.userService.logout();
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "Logout");
    }
  }

  /// [resetPassword] resets a user's password
  ///
  /// Argument(s):
  /// User - User object
  ///
  /// Returns: void
  ///
  static Future<void> resetPassword(String email) async {
    try {
      return Backendless.userService.restorePassword(email);
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "ResetPassword");
    }
  }

  /// [getCurrentUser] retrieves a record of the current
  /// user in session.
  ///
  /// Returns: BackendlessUser object of current User
  ///
  static Future<BackendlessUser?> getCurrentUser() async {
    try {
      return Backendless.userService.getCurrentUser();
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "GetCurrentUser");
    }
  }

  /// [getCurrentUser] retrieves a record of the current
  /// user in session.
  ///
  /// Returns: BackendlessUser object of current User
  ///
  static Future<List<BackendlessUser?>?> findUser(String email) async {
    try {

      DataQueryBuilder query = DataQueryBuilder()
        ..whereClause = "email = '$email'";
      return Backendless.data.withClass<BackendlessUser>().find(query);

    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "FindUser");
    }
  }
  /// [loginAsGuest] logins an anonymous user
  ///
  /// Returns: BackendlessUser object of newly created
  /// anonymous user.
  ///
  /// for more: https://backendless.com/docs/flutter/users_user_registration.html].
  ///
  static Future<BackendlessUser?> loginAsGuest() async {
    try {
      return Backendless.userService.loginAsGuest(false);
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "Logout");
    }
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
    try {
      return Backendless.userService.update(user);
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "UpdateProperty");
    }
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
