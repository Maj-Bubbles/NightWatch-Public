import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';

/// The following api implementation is inspired by Backendless'
/// documentation of the UserService API
/// found here: https://backendless.com/docs/flutter/users_overview.html
class BackendlessUserApi {
  final backendlessApi = Backendless();

  Future<BackendlessUser?> register(BackendlessUser user) {
    return Backendless.userService.register(user);
  }

  Future<BackendlessUser?> login(User user) {
    // stayLoggedIn parameter is best set to true
    // see: https://backendless.com/docs/flutter/users_login.html
    return Backendless.userService.login(user.email, user.password, true);
  }

  Future<void> logout() {
    return Backendless.userService.logout();
  }

  Future<void> resetPassword(User user) {
    return Backendless.userService.restorePassword(user.email);
  }

  Future<BackendlessUser?> getCurrentUser() {
    return  Backendless.userService.getCurrentUser();
  }

  /// According to Backendless, the process of using anonymous login consists of the following steps:
  /// 1. Login the user anonymously using the API documented below;
  /// 2. Perform any application specific logic, such as establishing data object
  /// relationships with the user data record;
  /// 3. Convert the guest user account to a registered user by using
  /// the user registration API[https://backendless.com/docs/flutter/users_user_registration.html].
  Future<BackendlessUser?> loginAsGuest() {
    // stayLoggedIn parameter is best set to false
    return Backendless.userService.loginAsGuest(false);
  }

  /// Useful for Updating a User's attributes such as UserName,
  /// region, primary and secondary numbers.
  /// For more see: https://backendless.com/docs/flutter/users_update_user_properties.html
  /// Precondition: The Backendless.setProperty must be update before passing the
  ///               BackendlessUser object to this class.
  ///               E.g user.setProperty("Primary_Number", 123456789);
  ///                   backendlessUserApi.updateProperty(user);
  Future<BackendlessUser?> updateProperty(BackendlessUser user) {
    return Backendless.userService.update(user);
  }

}