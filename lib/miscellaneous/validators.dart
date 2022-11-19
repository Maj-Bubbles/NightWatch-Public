import 'package:email_validator/email_validator.dart';

String? validateEmail(String? address) {
  if (address == null || address.isEmpty) {
    return 'Please enter your email address.';
  } else if (EmailValidator.validate(address)) {
    return 'Please enter a valid email address!';
  }
  return null;
}

String? validatePassword(String? password) {
  /*  Explanation of Regular Expression used under:
    - should contain at least one upper case, 
    - one lower case, 
    - at least one digit,
    - and at least 8 characters.
  */
  String? result;
  if (password == null || password.isEmpty) {
    result = 'Please enter your desired password.';
  } else if ((!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
      .hasMatch(password))) {
    result =
        'Please enter a valid password - 8 character with at least one upper & lower case letter and a digit';
  }
  return result;
}

String? validateNumber(String? number) {
  if (number == null || number.isEmpty) {
    return 'Please enter your contact number.';
  } else if ((!RegExp(r'^.{8,}$').hasMatch(number))) {
    //tests if the contact number has 10 digits
    return 'Please enter a valid contact number!';
  }
  return null;
}

String? validateRegion(String? region) {
  if (region == null || region.isEmpty) {
    return 'Please make a region selection.';
  } else {
    return null;
  }
}

String? validateEmptyTitle(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your title';
  }
  return null;
}

String? validateEmptyName(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your name';
  }
  return null;
}

String? validateEmptyMessage(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your message';
  }
  return null;
}

// Solomon's Regex email validator - replaced with email validator package
// String? validateEmail(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'please enter your email address';
//   } else if (!RegExp(
//           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//       .hasMatch(value)) {
//     return 'please enter a valid email address';
//   }
//   return null;
// }
