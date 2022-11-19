import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/views/widgets/forgot_password_w.dart';
import 'package:nightwatch/views/widgets/user_edit_name_widget.dart';

class UserEditName extends StatelessWidget {
  const UserEditName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: const UserEditNameForm(),
    );
  }
}
