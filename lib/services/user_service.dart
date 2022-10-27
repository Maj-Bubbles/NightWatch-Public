import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/repositories/repositories.dart';

class UserService extends UserServiceRepo {
  late BackendlessUserApi userServiceApi;
  
  UserService() {
    userServiceApi = BackendlessUserApi();
  }

  @override
  void checkIfUserExists(User user) {
    // TODO: implement checkIfUserExists
  }

  @override
  void checkIfUserIsAdmin(User user) {
    // TODO: implement checkIfUserIsAdmin
  }

  @override
  void checkIfUserLogged(User user) {
    // TODO: implement checkIfUserLogged
  }

  @override
  void forgotPassword(User user) {
    // TODO: implement forgotPassword
  }

  @override
  void logoutUser(User user) {
    // TODO: implement logoutUser
  }

  @override
  void registerUser(User user) {
    // TODO: implement registerUser
  }

  @override
  void signInUser(User user) {
    // TODO: implement signInUser
  }
}
