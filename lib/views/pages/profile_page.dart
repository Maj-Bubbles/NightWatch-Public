import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/models/media.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: scaffoldBackgroundColor,
          automaticallyImplyLeading: true,
          title: Title(
            color: appBarTitle,
            child: const Text(
              'Profile',
              style: headingsOne,
            ),
          ),
          actions: [
            Image.asset(
              'lib/media/profile.png',
              color: orangePeelForIconsAndButtons,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: scaffoldBackgroundColor,
            child: Column(
              children: [
////////////////////////////////////////////////////////////////////////////////
                Card(
                  color: Colors.blueGrey[200],
                  margin: const EdgeInsets.all(24.0),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Username'),
                        subtitle: const Text('severe_hive234'),
                        trailing: GestureDetector(
                          child: const Text('Edit'),
                          onTap: () {},
                        ),
                      ),
                      ListTile(
                        title: const Text('Names'),
                        subtitle: const Text('Isabella Bordeux'),
                        trailing: GestureDetector(
                          child: const Text('Edit'),
                          onTap: () {},
                        ),
                      ),
                      ListTile(
                        title: const Text('Emergency Number'),
                        subtitle: const Text('000 325 8756'),
                        trailing: GestureDetector(
                          child: const Text('Edit'),
                          onTap: () {},
                        ),
                      ),
                      ListTile(
                        title: const Text('Cellphone Number'),
                        subtitle: const Text('000 325 8756'),
                        trailing: GestureDetector(
                          child: const Text('Edit'),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),

////////////////////////////////////////////////////////////////////////////////
                const SizedBoxH10(),
                ListTile(
                  title: const Text(
                    'My Reports',
                    style: headingsTwo,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBoxH10(),
                Stack(alignment: Alignment.topLeft, children: const [
                  Text('Settings', style: headingsOne),
                ]),
                const SizedBoxH10(),
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.notifications_none,
                      color: jeansBlueForIcons,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: orangePeelForIconsAndButtons,
                    ),
                    title: Text('Notifications'),
                  ),
                ),
                const SizedBoxH10(),
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.pages,
                      color: jeansBlueForIcons,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: orangePeelForIconsAndButtons,
                    ),
                    title: Text('Terms and Conditions'),
                  ),
                ),
                const SizedBoxH10(),
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.language,
                      color: jeansBlueForIcons,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: orangePeelForIconsAndButtons,
                    ),
                    title: Text('Language Options'),
                  ),
                ),
                const SizedBoxH10(),
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: jeansBlueForIcons,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: orangePeelForIconsAndButtons,
                    ),
                    title: Text(
                      'Sign Out',
                    ),
                  ),
                ),
                const SizedBoxH10(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
