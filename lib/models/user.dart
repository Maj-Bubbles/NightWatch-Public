abstract class User {
  String _name = "";
  String _id = "";
  String _userName = "";
  String _emailAdd = "";
  String _password = "";
  bool _isAdmin = false;

  String get name => _name;
  set name(String value) {
    _name = value;
  }
  String get id => _id;
  set id(String value) {
    _id = value;
  }
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
  }
  String get email => _emailAdd;
  set email(String value) {
    _emailAdd = value;
  }
  String get password => _password;
  set password(String value) {
    _password = value;
  }

  bool get isAdmin => _isAdmin;
  set isAdmin(bool value) {
    isAdmin = value;
  }
}
