import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nightwatch/miscellaneous/configuration.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/repositories/language_option.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/views/pages/non_imminent_report_user.dart';
import 'package:provider/provider.dart';

class LanguageChange extends StatefulWidget {
  const LanguageChange({super.key});

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Language Options'),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 26.0,
              bottom: 8.0,
            ),
            child: Image.asset(
              'media/lang-Image.png',
              height: 200,
            ),
          ),
          const SizedBox(
            height: 80,
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
              child: Consumer<ReportsViewModel>(
                builder: (context, viewModel, child) {
                  return Container();
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 100.0,
              right: 100.0,
              top: 15.0,
              bottom: 8.0,
            ),
            child: Text.rich(
              TextSpan(
                text: 'Please restart the app for changes to take effect.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
