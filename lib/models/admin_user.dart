/// This is [AdminUser] class that models data
/// of interest from an admin user.
/// It inherits from the generic User abstract interface.

import 'models.dart';

class AdminUser extends User {
  final String tellNum;
  final String adminCellNum;

  AdminUser({
    required this.tellNum,
    required this.adminCellNum,
    required super.name,
    required super.userName,
    required super.isAdmin,
    required super.emailAdd,
    required super.region,
    required super.password,
    required super.primaryNumber,
    required super.secondaryNumber
  });
}
