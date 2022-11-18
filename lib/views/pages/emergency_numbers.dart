import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
        title: const Text(
          'Emergency',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.emergency),
            title: Text('ER24'),
            trailing: Text('084 124'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.emergency),
            title: Text('Ambulance'),
            trailing: Text('101 777'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.local_police),
            title: Text('Police'),
            trailing: Text('10 111'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('Fire Department'),
            trailing: Text('101 111'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: silverSandForFormsAndOtherStuff,
          ),
          ListTile(
            leading: Icon(Icons.coronavirus),
            title: Text('Covid-19 Hotline'),
            trailing: Text('084 133'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.child_care),
            title: Text('Children Hotline'),
            trailing: Text('084 666'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.girl_outlined),
            title: Text('Gender Based Violence'),
            trailing: Text('084 706'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.dangerous),
            title: Text('Anti-Corruption'),
            trailing: Text('0800 701 701'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.stop),
            title: Text('Crime Stop (Anonymous)'),
            trailing: Text('086 001 0111'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.traffic),
            title: Text('Traffic Call Center'),
            trailing: Text('086 140 0800'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.water),
            title: Text('Water Department'),
            trailing: Text('080 020 0200'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.electrical_services),
            title: Text('Electricity Outages'),
            trailing: Text('081 409 2345'),
            iconColor: orangePeelForIconsAndButtons,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
