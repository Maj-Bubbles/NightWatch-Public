import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/locator_service.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class UserEditNameForm extends StatefulWidget {
  const UserEditNameForm({super.key});

  @override
  State<UserEditNameForm> createState() => _UserEditNameFormState();
}

class _UserEditNameFormState extends State<UserEditNameForm> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
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
                'Edit Name',
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
                    controller: nameController,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Name'),
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
                        StatusDialog(
                            message: 'Your name was succesfully edited.',
                            title: 'Edit Name'),
                      );
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
