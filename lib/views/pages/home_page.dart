import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/views/pages/reports_feed.dart';
import 'package:nightwatch/views/widgets/emergency_numbers_page.dart';
import 'package:nightwatch/views/widgets/user_profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const ReportsFeedScreen(),
    const EmergencyNumbersScreen(),
    const UserProfileScreen(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Reports',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 1,
              top: 10,
              right: 8,
              bottom: 10,
            ),
            child: MaterialButton(
              color: redButtonColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 5,
              onPressed: () {
                navigatorService.navigateTo(RouteManager.userReportingPage);
              },
              child: Row(
                children: const [
                  Text(
                    'REPORT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: scaffoldBackgroundColor,
        selectedItemColor: orangePeelForIconsAndButtons,
        unselectedItemColor: silverSandForFormsAndOtherStuff,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emergency,
            ),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          //   CircleAvatar(
          //     foregroundColor: silverSandForFormsAndOtherStuff,
          //     backgroundColor: scaffoldBackgroundColor,
          //     radius: 14,
          //     child: Icon(
          //       Icons.person,
          //     ),
          //   ),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
