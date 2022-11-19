import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/configuration.dart' as configuration;
import 'package:nightwatch/miscellaneous/constants.dart' as constants;
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/view_models/register_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../miscellaneous/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController firstAndLastNameController;
  late TextEditingController primaryNumController;
  late TextEditingController secondaryNumController;
  late TextEditingController regionController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    firstAndLastNameController = TextEditingController();
    primaryNumController = TextEditingController();
    secondaryNumController = TextEditingController();
    regionController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    firstAndLastNameController.dispose();
    primaryNumController.dispose();
    secondaryNumController.dispose();
    regionController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterViewModel>().registerFormKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 48, right: 48, bottom: 8),
        child: ListView(
          children: [
            const SizedBoxH30(),
            const Center(
              child: Text(
                'Please enter the following fields to continue',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Center(
                child: TextFormField(
                  controller: firstAndLastNameController,
                  cursorColor: scaffoldBackgroundColor,
                  decoration: formDecoration('First and Last Name'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Center(
                child: Selector<RegisterViewModel, bool>(
                  selector: (context, value) => value.createAdmin,
                  builder: (context, value, child) {
                    return value
                        ? TextFormField(
                            controller: primaryNumController,
                            cursorColor: scaffoldBackgroundColor,
                            decoration: formDecoration('Company Telephone'),
                          )
                        : TextFormField(
                            controller: primaryNumController,
                            cursorColor: scaffoldBackgroundColor,
                            decoration: formDecoration('Cellphone Number'),
                          );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Center(
                child: Selector<RegisterViewModel, bool>(
                  selector: (context, value) => value.createAdmin,
                  builder: (context, value, child) {
                    return value
                        ? TextFormField(
                            controller: secondaryNumController,
                            cursorColor: scaffoldBackgroundColor,
                            decoration:
                                formDecoration('Admin Cellphone (Personal)'),
                          )
                        : TextFormField(
                            controller: secondaryNumController,
                            cursorColor: scaffoldBackgroundColor,
                            decoration: formDecoration('Emergency Contact'),
                          );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Consumer<RegisterViewModel>(
                builder: (context, viewModel, child) {
                  return RegionDropdown(
                    items: viewModel.items,
                    text: 'Region',
                    iconData: Icons.map_outlined,
                    onChanged: (value) {
                      viewModel.selectedValue = value ?? '';
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
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
            const SizedBox(height: 20),
            Container(
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
                  'Sign Up',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.orange.withOpacity(.32);
                    }
                    return Colors.orange;
                  }),
                  value: context.watch<RegisterViewModel>().createAdmin,
                  onChanged: ((value) {
                    context.read<RegisterViewModel>().checkCreateAdmin();
                  }),
                ),
                const Text(
                  'Apply For Admin Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.orange.withOpacity(.32);
                    }
                    return Colors.orange;
                  }),
                  value: context.watch<RegisterViewModel>().confirmTcsCs,
                  onChanged: ((value) {
                    context.read<RegisterViewModel>().checkConfirmedTcsAndCs();
                  }),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'By checking this box, you are accepting our ',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pop();
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  /*Text(
                    'By checking this box, you are accepting our $TermsAndConsButton()',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),*/

                  /*Text.rich(
                    TextSpan(
                      text:
                          'By checking this box, you are accepting our',
                      style:  TextStyle(
                        color: silverSandForFormsAndOtherStuff,
                        fontSize: 22,
                        letterSpacing: 5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            color: redButtonColor,
                            fontSize: 22,
                          ),
                          recognizer: TapGestureRecognizer().onTap =() {
                            
                          }
                        ),
                      ],
                    ),
                  ), */
                )
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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

class TermsAndConsButton extends StatelessWidget {
  const TermsAndConsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).popAndPushNamed(RouteManager.loginPage);
      },
      child: const Text(
        'terms and conditions',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.visible,
            fontSize: 8),
      ),
    );
  }
}

class RegionDropdown extends StatelessWidget {
  const RegionDropdown(
      {Key? key,
      required this.items,
      required this.text,
      required this.iconData,
      required this.onChanged})
      : super(key: key);

  final List<DropdownMenuItem<String>>? items;
  final String text;
  final IconData iconData;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      validator: validateRegion,
      style: const TextStyle(color: scaffoldBackgroundColor),
      dropdownColor: Colors.grey,
      icon: const Icon(Icons.map_outlined),
      iconEnabledColor: scaffoldBackgroundColor,
      decoration: configuration.formDecoration('Region'),
    );
  }
}
