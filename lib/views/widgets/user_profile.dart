import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return ListView(
      children: [
        Card(
          color: silverSandForFormsAndOtherStuff,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Text(
                    'severe_hive_234',
                    style: TextStyle(
                      color: scaffoldBackgroundColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                  ),
                  child: Text(
                    'Names',
                    style: TextStyle(
                      color: scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Isabella Bordeux',
                        style: TextStyle(
                          color: scaffoldBackgroundColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 170,
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorService.navigateTo(RouteManager.userEditNamePage);
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                  ),
                  child: Text(
                    'Emergency Number',
                    style: TextStyle(
                      color: scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '000 325 8756',
                        style: TextStyle(
                          color: scaffoldBackgroundColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 183,
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorService.navigateTo(RouteManager.userEditEmergencyNumberPage);
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                  ),
                  child: Text(
                    'Cellphone Number',
                    style: TextStyle(
                      color: scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '000 325 8756',
                        style: TextStyle(
                          color: scaffoldBackgroundColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 183,
                      ),
                      TextButton(
                        onPressed: () {
                          navigatorService.navigateTo(RouteManager.userEditCellNumberPage);
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                            color: scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {
              navigatorService.navigateTo(RouteManager.repotsByUserPage);
            },
            title: const Text(
              'My Reports',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: redButtonColor,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 22,
              color: appBarTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: const Icon(
              Icons.notifications,
              color: orangePeelForIconsAndButtons,
            ),
            onTap: () {},
            title: const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: tropicalForContainerAndButtonColor,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: const Icon(
              Icons.policy,
              color: orangePeelForIconsAndButtons,
            ),
            onTap: () {
              navigatorService.navigateTo(RouteManager.termsAndConditionsPage);
            },
            title: const Text(
              'Terms and Conditions',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: tropicalForContainerAndButtonColor,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: const Icon(
              Icons.language,
              color: orangePeelForIconsAndButtons,
            ),
            onTap: () {},
            title: const Text(
              'Language Options',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: tropicalForContainerAndButtonColor,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: const Icon(
              Icons.logout,
              color: orangePeelForIconsAndButtons,
            ),
            onTap: () {},
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: tropicalForContainerAndButtonColor,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
