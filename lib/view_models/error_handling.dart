/// This file contains Logic exceptions that catch
/// only particular types of exceptions that concern our
/// applications data flow and then customizing them to error
/// messages that users can understand.

import 'package:flutter/services.dart';

/// All possible errors that might be triggered
/// through the use of the `userService` api are
/// handled by this class.
class UserAPIException extends NighWatchException {
  UserAPIException({required super.title, required super.message});

  factory UserAPIException.fromPlatformException(PlatformException error) {
    var mapToBackendLessError = BackendlessErrorCodes[error];
    return AuthenticationErrorDialogs[mapToBackendLessError] ??
        error as UserAPIException;
  }

  // https://backendless.com/docs/rest/backendless_error_codes.html
  static const emailInUse = "Email in use";
  static const wrongEmailFormat = "Wrong email format";
  static const unknownEmailAddress = "Unknown email address";
  static const emailNotVerified = "Email not verified";
  static const emailAlreadyVerified = "Email already verified";
  static const invalidLoginOrPassword = "Invalid login or password";

  // Map Backendless userService Error codes to short descriptions above
  static final Map<String, String> BackendlessErrorCodes = {
    "3033": emailInUse,
    "3020": unknownEmailAddress,
    "3040": wrongEmailFormat,
    "3087": emailNotVerified,
    "3102": emailAlreadyVerified,
    "3104": unknownEmailAddress,
    "3003": invalidLoginOrPassword,
  };

  // Use short descriptions above as Keys to Human readable
  // Exceptions that maybe used in Dialogs.
  static final Map<String, UserAPIException> AuthenticationErrorDialogs = {
    emailNotVerified: UserAPIException(
        title: "Verification pending",
        message: "Please verify your email address before logging in."),
    invalidLoginOrPassword: UserAPIException(
        title: "Invalid login or password",
        message:
            "The address and password you entered don't form a valid login."),
    wrongEmailFormat: UserAPIException(
        title: "Invalid address",
        message: "Please enter a valid email address."),
    emailInUse: UserAPIException(
        title: "User exists",
        message: "There is already an account for this email address."),
    emailAlreadyVerified: UserAPIException(
        title: "Already verified",
        message:
            "This email address has already been verified; no new verification email has been sent."),
    unknownEmailAddress: UserAPIException(
        title: "Unknown email address",
        message: "No account is registered under this email address."),
  };
}

class NighWatchException {
  final String title;
  final String message;

  NighWatchException({required this.title, required this.message});
}

class StatusDialog {
  final String title;
  final String message;

  StatusDialog({required this.title, required this.message});

}
