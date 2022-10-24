/// This is [PublicUser] class that models data
/// of interest from an public user.
/// It inherits from the generic User abstract interface.

import 'models.dart';

class PublicUser  extends User {
  String _cellNum = "";
  String _emergencyNum = "";

  String get cellNum => _cellNum;
  set cellNum(String value) {
    _cellNum = value;
  }

  String get emergencyNum => _emergencyNum;
  set emergencyNum(String value) {
    _emergencyNum = value;
  }
}