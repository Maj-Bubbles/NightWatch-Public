import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/repositories.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/base_view_model.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class UserViewModel extends BaseViewModel {
  late UserServiceRepo _userService;
  late BackendlessUser _currentUser;

  UserServiceRepo get userService => _userService;
  BackendlessUser get currentUser => _currentUser;

  UserViewModel() {
    _userService = UserService();
    _currentUser = BackendlessUser();
  }

  Future<void> registerUser(User user) async {
    try {
      setState(ViewState.Busy);
      _currentUser =
          await _userService.registerUser(user);
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setErrorDialog(error);
    }
  }

  Future<void> signInUser({required String email, required String password}) async {
    try {
      checkIfUserIsLoggedIn();
      setState(ViewState.Busy);
      _currentUser =
      await _userService.signInUser(email: email, password: password);
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setErrorDialog(error);
    }
  }

  Future<void> logoutUser() async {
    try {
      setState(ViewState.Busy);
      await _userService.logoutUser();
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setErrorDialog(error);
    }
  }
  Future<void> forgotPassword(String email) async {
    try {
      setState(ViewState.Busy);
      await _userService.resetPassword(email: email);
      setState(ViewState.Success);
    } on UserAPIException catch (error) {
      setErrorDialog(error);
    }
  }
  Future<bool> checkIfUserIsLoggedIn() async {
      return await _userService.checkIfUserLogged();
  }
  Future<bool> checkIfUserExists(String email) async {
   return await _userService.checkIfUserExists(email: email);
  }
  Future<bool> checkIfUserIsAdmin() async {
    return await _userService.checkIfUserIsAdmin();
  }

}
