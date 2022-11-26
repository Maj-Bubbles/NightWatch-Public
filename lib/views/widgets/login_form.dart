import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';

import '../../models/view_state.dart';
import '../../view_models/user_view_model.dart';

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
    var navigatorService = context.read<NavigationAndDialogService>();
    return Form(
      key: context.read<UserViewModel>().loginFormKey,
      child: Stack(
        children: [
          Padding(
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
                        keyboardType: TextInputType.emailAddress,
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: passwordController,
                        cursorColor: scaffoldBackgroundColor,
                        decoration: formDecoration('Password'),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      navigatorService
                          .navigateTo(RouteManager.forgotPasswordPage);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: silverSandForFormsAndOtherStuff,
                        fontSize: 14,
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                      top: 12.0,
                      bottom: 8.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        context.read<UserViewModel>().signInUser(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: orangePeelForIconsAndButtons,
                      textColor: Colors.white,
                      child: const Text(
                        'Sign In',
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    navigatorService.navigateTo(RouteManager.signUpPageBub);
                  },
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
                                  'Logging you in. Please wait',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                case ViewState.Success:
                  viewModel.setViewStateToIdle();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    navigatorService
                        .navigateTo(RouteManager.userRepotsFeedPage);
                  });
                  return Container();
                case ViewState.Error:
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    navigatorService.showSnackBar(viewModel.errorDialog);
                    viewModel.setState(ViewState.Idle);
                  });
                  return Container();
                default:
                  return const Text("Something Should Have happened");
              }
            },
          ),
        ],
      ),
    );
  }
}

class LoadingIndicatorV2 extends StatelessWidget {
  const LoadingIndicatorV2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: SizedBox(
            height: 175,
            width: 300,
            child: Card(
              color: scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Logging you in',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      const Image(
                        image: AssetImage('media/Splash_GitHub_Page.png'),
                        height: 75,
                      ),
                      LoadingBouncingGrid.square(
                        backgroundColor: orangePeelForIconsAndButtons,
                        size: 75,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please wait',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// \class AppTextField extends StatelessWidget {
//   const AppTextField({
//     Key? key,
//     required this.controller,
//     required this.validator,
//     required this.decorationString,
//     TextInputType ttextInputType = TextInputType.text,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final String decorationString;
//   final TextInputType textInputType = ttextInputType;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 40.0,
//         right: 40.0,
//         top: 26.0,
//         bottom: 8.0,
//       ),
//       child: Container(
//         color: silverSandForFormsAndOtherStuff,
//         height: 63,
//         child: Center(
//           child: TextFormField(
//             validator: validator,
//             controller: controller,
//             keyboardType: textInputType,
//             cursorColor: scaffoldBackgroundColor,
//             decoration: formDecoration('Email Address'),
//           ),
//         ),
//       ),
//     );
//   }
// }









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nightwatch/miscellaneous/configuration.dart';
// import 'package:nightwatch/miscellaneous/validators.dart';
// import 'package:nightwatch/view_models/user_view_model.dart';
// import 'package:provider/provider.dart';

// class LoginScreenForm extends StatefulWidget {
//   const LoginScreenForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<LoginScreenForm> createState() => _LoginScreenFormState();
// }

// class _LoginScreenFormState extends State<LoginScreenForm> {
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Form(
//             key: context.read<UserViewModel>().loginFormKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Card(
//                   clipBehavior: Clip.antiAlias,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                   elevation: 20,
//                   child: Image.asset('lib/media/Login.png'),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Sign in to Continue',
//                   style: GoogleFonts.dmSans(
//                     fontSize: 30,
//                     color: const Color(0xFFFFFFFF),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   validator: validateEmail,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: formDecoration('Email Address'),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: passwordController,
//                   validator: validatePassword,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: formDecoration('Password'),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 MaterialButton(
//                   height: 50,
//                   minWidth: 150,
//                   onPressed: () {},
//                   color: const Color(0xFFFBA00A),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40)),
//                   child: const Text(
//                     'Log In',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
