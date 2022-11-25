import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:provider/provider.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Form(
      //key: loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBoxH30(),
            const SizedBoxH30(),
            const SizedBoxH30(),
            const SizedBoxH30(),
            const Center(
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBoxH30(),
            const SizedBoxH30(),
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
            const SizedBoxH30(),
            const SizedBoxH30(),
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 12.0,
                bottom: 8.0,
              ),
              child: MaterialButton(
                onPressed: () {
                  navigatorService.showSnackBar(StatusDialog(
                      message:
                          'Check your email address for further instructions on how to reset your password.',
                      title: 'Password Reset'));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: orangePeelForIconsAndButtons,
                textColor: Colors.white,
                child: const Text(
                  'Submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
