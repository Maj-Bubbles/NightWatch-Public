import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:provider/provider.dart';

class SignUpFormTwo extends StatefulWidget {
  const SignUpFormTwo({super.key});

  @override
  State<SignUpFormTwo> createState() => _SignUpFormTwoState();
}

class _SignUpFormTwoState extends State<SignUpFormTwo> {
  late TextEditingController companyEmailController;
  late TextEditingController companyNameController;
  late TextEditingController companyTelephoneController;
  late TextEditingController personalCellphoneController;
  late TextEditingController regionController;
  late TextEditingController passwordController;

  List<String> regions = <String>['Thabong', 'Welkom'];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    companyEmailController = TextEditingController();
    companyNameController = TextEditingController();
    companyTelephoneController = TextEditingController();
    personalCellphoneController = TextEditingController();
    regionController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    companyEmailController.dispose();
    companyNameController.dispose();
    companyTelephoneController.dispose();
    personalCellphoneController.dispose();
    regionController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBoxH10(),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 3.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validateEmptyName,
                    controller: companyNameController,
                    keyboardType: TextInputType.name,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Company Name'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 3.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validateNumber,
                    controller: companyTelephoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Company Telephone'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 3.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validateNumber,
                    controller: personalCellphoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Personal Cellphone (Admin)'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 3.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Text(
                          'Select Region',
                          style: TextStyle(
                            color: scaffoldBackgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 26,
                      ),
                      DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: Icon(Icons.arrow_downward),
                        ),
                        elevation: 16,
                        style: const TextStyle(
                          color: redButtonColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                            regionController.text = value;
                          });
                          print(regionController.text);
                        },
                        items: regions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 3.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validateEmail,
                    controller: companyEmailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Company Email'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 3.0,
              ),
              child: Container(
                color: silverSandForFormsAndOtherStuff,
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validatePassword,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Password'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 12.0,
                bottom: 1.0,
              ),
              child: MaterialButton(
                onPressed: () {
                  navigatorService.showSnackBar(StatusDialog(message: 'Profile created Successfuly', title: 'Sign Up'));
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
            TextButton(
              onPressed: () {
               navigatorService.navigateTo(RouteManager.loginPage);
              },
              child: const Text(
                'Already have an account?',
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
