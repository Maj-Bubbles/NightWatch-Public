import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';

abstract class UserServiceRepo {

  Future<BackendlessUser> registerUser(User user);

  Future<BackendlessUser> signInUser({required String email, required String password});

  Future<void> logoutUser();

  Future<void> resetPassword({required String email});

  Future<bool> checkIfUserLogged();

  Future<bool> checkIfUserExists({required String email});

  Future<bool> checkIfUserIsAdmin();
}
