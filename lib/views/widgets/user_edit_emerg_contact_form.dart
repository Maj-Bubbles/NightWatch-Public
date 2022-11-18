import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/locator_service.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';

class UserEmergencyContactForm extends StatefulWidget {
  const UserEmergencyContactForm({super.key});

  @override
  State<UserEmergencyContactForm> createState() =>
      _UserEmergencyContactFormState();
}

class _UserEmergencyContactFormState extends State<UserEmergencyContactForm> {
  late TextEditingController emergencyNumberController;

  @override
  void initState() {
    super.initState();
    emergencyNumberController = TextEditingController();
  }

  @override
  void dispose() {
    emergencyNumberController.dispose();
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
            const SizedBoxH30(),
            const SizedBoxH30(),
            const SizedBoxH30(),
            const Center(
              child: Text(
                'Edit Emergency Number',
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
                    validator: validateEmptyName,
                    controller: emergencyNumberController,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Emergency Number'),
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
                  locator.get<NavigationAndDialogService>().showSnackBar(
                      message: 'Your number was succesfully updated.',
                      title: 'Edit Emergency Number');
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
