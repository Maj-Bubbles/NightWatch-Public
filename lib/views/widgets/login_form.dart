import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/view_models/register_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:nightwatch/services/locator_service.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';

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
      key: context.read<RegisterViewModel>().loginFormKey,
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
                    controller: passwordController,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Password'),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                locator
                    .get<NavigationAndDialogService>()
                    .navigateTo(RouteManager.forgotPasswordPage);
              },
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
                onPressed: () {
                  locator
                      .get<NavigationAndDialogService>()
                      .navigateTo(RouteManager.userRepotsFeedPage);
                },
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
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.signUpPageBub);
                // locator
                //     .get<NavigationAndDialogService>()
                //     .navigateTo(RouteManager.signUpPage); commit screens
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
    );
  }
}

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
