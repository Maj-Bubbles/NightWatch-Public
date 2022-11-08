import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/views/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: orangePeelForIconsAndButtons,
        child: const Icon(
          Icons.emergency_outlined,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: const Text(
          'Login',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 30,
          ),
        ),
      ),
      body: Stack(
        children: const [
          LoginForm(),
        ],
      ),
    );
  }
}
