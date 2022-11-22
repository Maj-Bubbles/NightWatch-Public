import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/configuration.dart' as configuration;
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/models/models.dart';
import 'package:provider/provider.dart';

import '../../miscellaneous/constants.dart';

class SignUpFormBub extends StatefulWidget {
  const SignUpFormBub({super.key});

  @override
  State<SignUpFormBub> createState() => _SignUpFormBubState();
}

class _SignUpFormBubState extends State<SignUpFormBub> {
  late TextEditingController firstAndLastNameController;
  late TextEditingController userNameController;
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
    userNameController = TextEditingController();
    secondaryNumController = TextEditingController();
    regionController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    firstAndLastNameController.dispose();
    userNameController.dispose();
    primaryNumController.dispose();
    secondaryNumController.dispose();
    regionController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Form(
      key: context.read<UserViewModel>().registerFormKey,
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 48, right: 48, bottom: 8),
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
                    child: Selector<UserViewModel, bool>(
                      selector: (context, value) => value.createAdmin,
                      builder: (context, value, child) {
                        return value
                            ? TextFormField(
                                validator: validateRequired,
                                controller: firstAndLastNameController,
                                cursorColor: scaffoldBackgroundColor,
                                decoration: formDecoration('Company Name'),
                              )
                            : TextFormField(
                                validator: validateRequired,
                                controller: firstAndLastNameController,
                                cursorColor: scaffoldBackgroundColor,
                                decoration:
                                    formDecoration('First and Last Name'),
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
                    child: TextFormField(
                      validator: validateRequired,
                      controller: userNameController,
                      cursorColor: scaffoldBackgroundColor,
                      decoration: formDecoration('Username'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: silverSandForFormsAndOtherStuff,
                  height: 63,
                  child: Center(
                    child: Selector<UserViewModel, bool>(
                      selector: (context, value) => value.createAdmin,
                      builder: (context, value, child) {
                        return value
                            ? TextFormField(
                                validator: validateNumber,
                                keyboardType: TextInputType.phone,
                                controller: primaryNumController,
                                cursorColor: scaffoldBackgroundColor,
                                decoration: formDecoration('Company Telephone'),
                              )
                            : TextFormField(
                                validator: validateNumber,
                                keyboardType: TextInputType.phone,
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
                    child: Selector<UserViewModel, bool>(
                      selector: (context, value) => value.createAdmin,
                      builder: (context, value, child) {
                        return value
                            ? TextFormField(
                                validator: validateNumber,
                                keyboardType: TextInputType.phone,
                                controller: secondaryNumController,
                                cursorColor: scaffoldBackgroundColor,
                                decoration: formDecoration(
                                    'Admin Cellphone (Personal)'),
                              )
                            : TextFormField(
                                validator: validateNumber,
                                keyboardType: TextInputType.phone,
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
                  child: Consumer<UserViewModel>(
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
                      obscureText: true,
                      controller: passwordController,
                      cursorColor: scaffoldBackgroundColor,
                      decoration: formDecoration('Password'),
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
                      value: context.watch<UserViewModel>().createAdmin,
                      onChanged: ((value) {
                        context.read<UserViewModel>().checkCreateAdmin();
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
                      value: context.watch<UserViewModel>().confirmTcsCs,
                      onChanged: ((value) {
                        context.read<UserViewModel>().checkConfirmedTcsAndCs();
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
                                  Navigator.of(context).pushNamed(
                                      RouteManager.termsAndConditionsPage);
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
                Padding(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                      top: 12.0,
                      bottom: 8.0,
                    ),
                    child: Consumer<UserViewModel>(
                        builder: (context, viewModel, _) {
                      switch (viewModel.state) {
                        case ViewState.Idle:
                          return MaterialButton(
                            onPressed: () {
                              context.read<UserViewModel>().registerUserHelper(
                                  email: emailController.text.trim(),
                                  name: firstAndLastNameController.text.trim(),
                                  userName: userNameController.text.trim(),
                                  emailAdd: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  isAdmin:
                                      context.read<UserViewModel>().createAdmin,
                                  primaryNumber:
                                      primaryNumController.text.trim(),
                                  secondaryNumber:
                                      secondaryNumController.text.trim(),
                                  region: context
                                      .read<UserViewModel>()
                                      .selectedValue,
                                  cellNum: primaryNumController.text.trim(),
                                  emergencyNum:
                                      secondaryNumController.text.trim());
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: orangePeelForIconsAndButtons,
                            textColor: Colors.white,
                            child: const Text(
                              'Sign Up',
                            ),
                          );
                        // case ViewState.Busy:
                        //   return const CircularProgressIndicator(
                        //     semanticsLabel: "Signing You Up",
                        //   );
                        case ViewState.Success:
                          WidgetsBinding.instance.addPostFrameCallback(
                            (timeStamp) {
                              context.read<UserViewModel>().confirmTcsCs =
                                  false;
                              // viewModel.setViewStateToIdle();
                              // Future.delayed(const Duration(seconds: 3));
                              //TODO: viewState.Success being picked up by popped page (login), thus advancing it to home page
                              Navigator.pop(context);
                            },
                          );
                          return const Text('Should Navigate to Login Page');
                        case ViewState.Error:
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            navigatorService
                                .showSnackBar(viewModel.errorDialog);
                            viewModel.setState(ViewState.Idle);
                          });
                          return Container();
                        default:
                          return const Text("Something Should Have happend");
                      }
                    })),
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
          Consumer<UserViewModel>(
            builder: (context, viewModel, _) {
              switch (viewModel.state) {
                case ViewState.Idle:
                  return Container();
                case ViewState.Busy:
                  return Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: SizedBox(
                          height: 100,
                          width: 300,
                          child: Card(
                            color: scaffoldBackgroundColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                                SizedBox(width: 20),
                                Text(
                                  'Signing you up. Please wait',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                default:
                  return Container();
              }
            },
          ),
        ],
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
