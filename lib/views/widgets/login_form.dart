import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
    return Form(
      //key: loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBoxH30(),
            const Image(
              image: AssetImage('media/Splash_GitHub_Page.png'),
              height: 150,
            ),
            const SizedBoxH10(),
            const Center(
              child: Text(
                'Sign in to continue',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 26.0,
                bottom: 8.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validateEmail,
                    controller: emailController,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Email Address'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 12.0,
                bottom: 8.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validatePassword,
                    controller: passwordController,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Password'),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 12.0,
                bottom: 8.0,
              ),
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: orangePeelForIconsAndButtons,
                textColor: Colors.white,
                child: const Text(
                  'Sign In',
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
