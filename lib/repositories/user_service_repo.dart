import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';

abstract class UserServiceRepo {
  Future<BackendlessUser> registerUser(User user);

  Future<BackendlessUser> signInUser(
      {required String email, required String password});

  Future<bool> logoutUser();

  Future<bool> resetPassword({required String email});

  Future<BackendlessUser?> checkIfUserLogged();

  Future<bool> checkIfUserExists({required String email});

  Future<bool> checkIfUserIsAdmin();
}
