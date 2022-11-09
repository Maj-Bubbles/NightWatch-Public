/// This is [PublicUser] class that models data
/// of interest from an public user.
/// It inherits from the generic User abstract interface.

import 'models.dart';

class PublicUser extends User {
  final String cellNum;
  final String emergencyNum;

  PublicUser(
      {required this.cellNum,
      required this.emergencyNum,
      required super.name,
      required super.userName,
      required super.isAdmin,
      required super.emailAdd,
      required super.password,
      required super.primaryNumber,
      required super.secondaryNumber});
}
