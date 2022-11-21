import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:provider/provider.dart';

class Reporting extends StatefulWidget {
  const Reporting({super.key});

  @override
  State<Reporting> createState() => _ReportingState();
}

class _ReportingState extends State<Reporting> {
  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Reporting',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 160,
              ),
              MaterialButton(
                height: 80,
                color: redButtonColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 5,
                onPressed: () {
                  navigatorService.navigateTo(RouteManager.userReportImminentPage);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'I am in danger now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                height: 80,
                color: tropicalForContainerAndButtonColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 5,
                onPressed: () {
                  navigatorService.navigateTo(RouteManager.userReportImminentPage);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'File a normal report',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
