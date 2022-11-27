import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/repositories.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import '../repositories/apis/backendless_apis.dart';

class UserService extends UserServiceRepo {
  late final BackendlessUserApi _userApi;

  // The api should be injected to allow
  // testability of the service.
  UserService(BackendlessUserApi api) : _userApi = api;

  @override
  Future<bool> checkIfUserExists({required String email}) async {
    try {
      List<BackendlessUser?>? existingUsers = await _userApi.findUser(email);

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
      var currentUser = await _userApi.getCurrentUser();

      if (currentUser == null || currentUser.getProperty("Admin") == null) {
        return false;
      }

      return currentUser.getProperty("Admin") as bool;
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<BackendlessUser?> checkIfUserLogged() async {
    try {
      late String result;
      bool ifError = false;
      BackendlessUser? loggedInUser;
      // result = await _userApi.isValidLogin() ?? result;
      bool? validUser = await Backendless.userService.isValidLogin().onError(
        (error, stackTrace) {
          ifError = true;
          result = error.toString();
        },
      );
      if (validUser != null && validUser) {
        String? userObjectId =
            await Backendless.userService.loggedInUser().onError(
          (error, stackTrace) {
            ifError = true;
            result = error.toString();
          },
        );
        if (userObjectId != null) {
          Map<dynamic, dynamic>? mapOfUser =
              await Backendless.data.of('Users').findById(userObjectId).onError(
            (error, stackTrace) {
              ifError = true;
              result = error.toString();
            },
          );
          if (mapOfUser != null) {
            loggedInUser = BackendlessUser.fromJson(mapOfUser);
          } else if (ifError) {
            throw UserAPIException(
                title: 'Log In Check Failed', message: result);
          }
        } else if (ifError) {
          throw UserAPIException(title: 'Log In Check Failed', message: result);
        }
      } else if (ifError) {
        throw UserAPIException(title: 'Log In Check Failed', message: result);
      }
      return loggedInUser;
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> resetPassword({required String email}) async {
    try {
      await _userApi.resetPassword(email);
      return true;
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> logoutUser() async {
    try {
      await _userApi.logout();
      return true;
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  @override
  Future<BackendlessUser> registerUser(User user) async {
    try {
      var backendlessUser = BackendlessUser();
      backendlessUser.setProperties({
        "email": user.emailAdd,
        "password": user.password,
        "Admin": user.isAdmin,
        "Username": user.userName,
        "Real_Name": user.name,
        "Region": user.region.name,
        "Primary_Number": user.primaryNumber,
        "Secondary_Number": user.secondaryNumber
      });
      // Nullability is not a concern. API Errors are caught
      // in the catch block below.
      return await _userApi.register(backendlessUser) ?? BackendlessUser();
    } on UserAPIException catch (_) {
      rethrow;
    }
  }

  /// Side Note: Its best to avoid Primitives without context
  /// But its left for simplicity. Antidote is a Data Class
  @override
  Future<BackendlessUser> signInUser(
      {required String email, required String password}) async {
    try {
      return await _userApi.login(email: email, password: password) ??
          BackendlessUser();
    } on UserAPIException catch (_) {
      rethrow;
    }
  }
}
