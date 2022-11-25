/// This is [AdminUser] class that models data
/// of interest from an admin user.
/// It inherits from the generic User abstract interface.

import 'package:backendless_sdk/backendless_sdk.dart';

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

  factory AdminUser.fromBackendlessUser(BackendlessUser user) {
    return AdminUser(
      name: user.properties['Real_Name'].toString(),
      userName: user.properties['Username'].toString(),
      emailAdd: user.properties['email'].toString(),
      password: user.properties['password'] ?? "",
      isAdmin: user.properties['Admin'] as bool,
      primaryNumber: user.properties['Primary_Number'].toString(),
      secondaryNumber: user.properties['Secondary_Number'].toString(),
      region: Region(name: user.properties['Region'].toString()),
      adminCellNum: user.properties['Primary_Number'].toString(),
      tellNum: user.properties['Secondary_Number'].toString(),
    );
  }

  factory AdminUser.defaultUser() {
    return AdminUser(
        tellNum: "",
        adminCellNum: "",
        name: "",
        userName: "",
        isAdmin: false,
        emailAdd: "",
        password: "",
        region: Region(name: ""),
        primaryNumber: "",
        secondaryNumber: "");
  }
}
