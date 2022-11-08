import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';

abstract class UserServiceRepo {

  Future<BackendlessUser> registerUser(User user);

  void signInUser({required String email, required String password});

  void logoutUser(User user);

  Future<void> resetPassword(String email);

  void checkIfUserLogged(User user);

  Future<bool> checkIfUserExists(String email);

  void checkIfUserIsAdmin(User user);
}
