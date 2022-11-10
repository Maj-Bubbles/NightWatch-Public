import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/repositories/repositories.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class UserService extends UserServiceRepo {

  @override
  Future<bool> checkIfUserExists({required String email}) async {
    try {
      List<BackendlessUser?>? existingUsers = await BackendlessUserApi.findUser(email);

      if (existingUsers == null || existingUsers.isEmpty) {
        return false;
      }
      return true;
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> checkIfUserIsAdmin() async {
    try {
      var currentUser = await BackendlessUserApi.getCurrentUser();

      if (currentUser == null) {
        return false;
      }
      return currentUser.getProperty("Admin") as bool;

    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> checkIfUserLogged() async {
    try {
      return await BackendlessUserApi.isValidLogin() ?? false;
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      BackendlessUserApi.resetPassword(email);
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      return await BackendlessUserApi.logout();
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<BackendlessUser> registerUser(User user) async {
    try {
      var backendlessUser = BackendlessUser()
        ..email = user.emailAdd
        ..password = user.password
        ..properties["admin"] = user.isAdmin
        ..properties["username"] = user.userName
        ..properties["real_name"] = user.name
        ..properties["region"] = user.region
        ..properties["primary_number"] = user.primaryNumber
        ..properties["secondary_number"] = user.secondaryNumber;

      // Nullability is not a concern. API Errors are caught
      // in the catch block below.
      return await BackendlessUserApi.register(backendlessUser) ??
          BackendlessUser();
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  /// Side Note: Its best to avoid Primitives without context
  /// But its left for simplicity. Antidote is a Data Class
  @override
  Future<BackendlessUser> signInUser({required String email, required String password}) async {
    try {
      return await BackendlessUserApi.login(email: email, password: password) ?? BackendlessUser();
    } on UserAPIException catch (_) {
      rethrow;
    }
  }
}
