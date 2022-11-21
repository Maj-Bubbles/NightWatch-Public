import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

import '../../miscellaneous/constants.dart';

class EmergencyNumScreen extends StatelessWidget {
  const EmergencyNumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => redButtonColor),
              ),
              onPressed: () {},
              child: const Text(
                'REPORT',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'Emergency',
            style: TextStyle(
              color: appBarTitle,
              fontSize: 30,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(color: scaffoldBackgroundColor),
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(
                  Icons.local_hospital,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "ER24",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "084 124",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.local_hospital,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "ER24",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "084 124",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.local_hospital,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Ambulance",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "10177",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.local_police,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Police",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "10111",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fire_extinguisher,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Fire Department",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "084 124",
                  style: headingsTwo,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.coronavirus_outlined,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "COVID-19 Hotline",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "084 124",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.child_care,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Children Hotline",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "0800 123 321",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.female,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Gender Based Violence Support",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "0800 428 428",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.money,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Anti-Corruption Helpline",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "0800 701 701",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.masks,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Crime Stop (anonymous)",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "08600 10111",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.local_taxi,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Traffic call center",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "0861 400 800",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.water,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Water Department",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "0800 200 200",
                  style: headingsTwo,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.electric_bolt_sharp,
                  color: orangePeelForIconsAndButtons,
                ),
                title: Text(
                  "Electricity Outages",
                  style: headingsTwo,
                ),
                trailing: Text(
                  "051 409 2345",
                  style: headingsTwo,
                ),
              ),
            ],
          ),
        ));
  }
}
