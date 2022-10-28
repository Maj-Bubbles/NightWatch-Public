/// This is [AdminUser] class that models data
/// of interest from an admin user.
/// It inherits from the generic User abstract interface.


import 'models.dart';

class AdminUser  extends User {
  String _tellNum = "";
  String _adminCellNum = "";

  String get tellNum => _tellNum;
  set tellNum(String value) {
    _tellNum = value;
  }

  String get adminCellNum => _adminCellNum;
  set adminCellNum(String value) {
    _adminCellNum = value;
  }
}