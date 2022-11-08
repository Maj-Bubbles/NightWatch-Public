import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          'Login',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      body: Stack(
        children: const [
          SingleChildScrollView(
            child: LoginScreenForm(),
          ),
        ],
      ),
    );
  }
}
