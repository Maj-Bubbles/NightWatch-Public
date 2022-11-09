/// This class is a Data Class that
/// models user data from the Views. The
/// BackendlessUser object is used as
/// Data transfer Object.
abstract class User {
  final String name;
  final String userName;
  final String emailAdd;
  final String password;
  final bool isAdmin;
  final String primaryNumber;
  final String secondaryNumber;

  User({
    required this.name,
    required this.userName,
    required this.emailAdd,
    required this.password,
    required this.isAdmin,
    required this.primaryNumber,
    required this.secondaryNumber
});
}
