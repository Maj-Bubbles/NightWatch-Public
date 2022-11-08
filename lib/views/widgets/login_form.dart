import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nightwatch/miscellaneous/configuration.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: context.read<UserViewModel>().loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 20,
                  child: Image.asset('lib/media/Login.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign in to Continue',
                  style: GoogleFonts.dmSans(
                    fontSize: 30,
                    color: const Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: emailController,
                  validator: validateEmail,
                  style: const TextStyle(color: Colors.black),
                  decoration: formDecoration('Email Address'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: validatePassword,
                  style: const TextStyle(color: Colors.black),
                  decoration: formDecoration('Password'),
                ),
                const SizedBox(
                  height: 60,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 150,
                  onPressed: () {},
                  color: const Color(0xFFFBA00A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
