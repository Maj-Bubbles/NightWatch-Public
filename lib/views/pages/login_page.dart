// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/views/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: orangePeelForIconsAndButtons,
        child: const Icon(
          Icons.emergency_outlined,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: const Text(
          'Login',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 30,
          ),
        ),
      ),
      body: Stack(
        children: const [
          SingleChildScrollView(
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}

// import '../widgets/login_form.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         automaticallyImplyLeading: false,
//         title: const Text(
//           'Login',
//           style: TextStyle(fontSize: 40, color: Colors.white),
//         ),
//       ),
//       body: Stack(
//         children: const [
//           SingleChildScrollView(
//             child: LoginScreenForm(),
//           ),
//         ],
//       ),
//     );
//   }
// }
