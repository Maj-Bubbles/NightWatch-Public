/// This is [PublicUser] class that models data
/// of interest from an public user.
/// It inherits from the generic User abstract interface.

import 'package:backendless_sdk/backendless_sdk.dart';

import 'models.dart';

class PublicUser extends User {
  final String cellNum;
  final String emergencyNum;

  PublicUser(
      {required this.cellNum,
      required this.emergencyNum,
      required super.id,
      required super.name,
      required super.userName,
      required super.isAdmin,
      required super.emailAdd,
      required super.password,
      required super.region,
      required super.primaryNumber,
      required super.secondaryNumber});

  factory PublicUser.fromBackendlessUser(BackendlessUser user) {
    return PublicUser(
      id: user.properties['objectId'].toString(),
      name: user.properties['Real_Name'].toString(),
      userName: user.properties['Username'].toString(),
      emailAdd: user.properties['email'].toString(),
      password: user.properties['password'] ?? "",
      isAdmin: user.properties['Admin'] as bool,
      primaryNumber: user.properties['Primary_Number'].toString(),
      secondaryNumber: user.properties['Secondary_Number'].toString(),
      region: Region(name: user.properties['Region'].toString()),
      cellNum: user.properties['Primary_Number'].toString(),
      emergencyNum: user.properties['Secondary_Number'].toString(),
    );
  }

  factory PublicUser.defaultUser() {
    return PublicUser(
        cellNum: "",
        emergencyNum: "",
        id: "",
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
