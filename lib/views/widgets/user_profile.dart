import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Container(
      margin: const EdgeInsets.all(14.0),
      child: ListView(
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              color: appBarTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            color: Colors.blueGrey[200],
            margin: const EdgeInsets.all(8.0),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                ProfileCard(
                    title: "Username",
                    subtitle: "Sever_User",
                    onTap: () {
                      navigatorService
                          .navigateTo(RouteManager.userEditNamePage);
                    }),
                ProfileCard(
                    title: "Names",
                    subtitle: "Isabella Bordeux",
                    onTap: () {
                      navigatorService
                          .navigateTo(RouteManager.userEditNamePage);
                    }),
                ProfileCard(
                    title: "Emergency Number",
                    subtitle: "089953845",
                    onTap: () {
                      navigatorService
                          .navigateTo(RouteManager.userEditEmergencyNumberPage);
                    }),
                ProfileCard(
                    title: "Cellphone Number",
                    subtitle: "87459347349",
                    onTap: () {
                      navigatorService
                          .navigateTo(RouteManager.userEditCellNumberPage);
                    }),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 5.0, right: 5.0, bottom: 5.0, top: 17.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              onTap: () {
                navigatorService.navigateTo(RouteManager.repotsByUserPage);
              },
              title: const Text(
                'My Reports',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              tileColor: orangePeelForIconsAndButtons,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            color: orangePeelForIconsAndButtons,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                color: appBarTitle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: orangePeelForIconsAndButtons,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: orangePeelForIconsAndButtons,
                  )),
              leading: const Icon(
                Icons.notifications,
                color: orangePeelForIconsAndButtons,
              ),
              onTap: () {},
              title: const Text(
                'Notifications',
                style: TextStyle(
                  color: orangePeelForIconsAndButtons,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tileColor: Colors.black,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: orangePeelForIconsAndButtons,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: orangePeelForIconsAndButtons,
                  )),
              leading: const Icon(
                Icons.policy,
                color: orangePeelForIconsAndButtons,
              ),
              onTap: () {
                navigatorService
                    .navigateTo(RouteManager.termsAndConditionsPage);
              },
              title: const Text(
                'Terms and Conditions',
                style: TextStyle(
                  color: orangePeelForIconsAndButtons,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tileColor: Colors.black,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: orangePeelForIconsAndButtons,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: orangePeelForIconsAndButtons,
                  )),
              leading: const Icon(
                Icons.language,
                color: orangePeelForIconsAndButtons,
              ),
              onTap: () {},
              title: const Text(
                'Language Options',
                style: TextStyle(
                  color: orangePeelForIconsAndButtons,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tileColor: Colors.black,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: orangePeelForIconsAndButtons,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: orangePeelForIconsAndButtons,
                  )),
              leading: const Icon(
                Icons.logout,
                color: orangePeelForIconsAndButtons,
              ),
              onTap: () {},
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: orangePeelForIconsAndButtons,
                  fontWeight: FontWeight.bold,
                ),
              ),
              tileColor: Colors.black,
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: orangePeelForIconsAndButtons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;
  const ProfileCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      elevation: 16,
      shadowColor: Colors.black,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: GestureDetector(
          child: const Text('Edit'),
          onTap: onTap,
        ),
      ),
    );
  }
}
