import 'package:nightwatch/models/models.dart';

abstract class UserServiceRepo {

  void registerUser(User user);

  void signInUser(User user);

  void logoutUser(User user);

  void forgotPassword(User user);

  void checkIfUserLogged(User user);

  void checkIfUserExists(User user);

  void checkIfUserIsAdmin(User user);
}
