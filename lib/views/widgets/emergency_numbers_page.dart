import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

class EmergencyNumbersScreen extends StatelessWidget {
  const EmergencyNumbersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.emergency),
          title: const Text('ER24'),
          trailing: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith((states) => 0),
              backgroundColor: MaterialStateProperty.resolveWith((states) => scaffoldBackgroundColor),
            ),
              onPressed: () async {
            var number = "084124";
            await FlutterPhoneDirectCaller.callNumber(number);
          }, child: const Text('084 124')),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        ListTile(
          leading: const Icon(Icons.emergency),
          title: const Text('Ambulance'),
          trailing: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                backgroundColor: MaterialStateProperty.resolveWith((states) => scaffoldBackgroundColor),
              ),
              onPressed: () async {
                var number = "10177";
                await FlutterPhoneDirectCaller.callNumber(number);
              }, child: const Text('10 177')),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        ListTile(
          leading: const Icon(Icons.local_police),
          title: const Text('Police'),
          trailing: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                backgroundColor: MaterialStateProperty.resolveWith((states) => scaffoldBackgroundColor),
              ),
              onPressed: () async {
                var number = "10 111";
                await FlutterPhoneDirectCaller.callNumber(number);
              }, child: const Text('10 111')),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        ListTile(
          leading: const Icon(Icons.local_fire_department),
          title: const Text('Fire Department'),
          trailing: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                backgroundColor: MaterialStateProperty.resolveWith((states) => scaffoldBackgroundColor),
              ),
              onPressed: () async {
                var number = "112";
                await FlutterPhoneDirectCaller.callNumber(number);
              }, child: const Text('112')),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          color: silverSandForFormsAndOtherStuff,
        ),
        const ListTile(
          leading: Icon(Icons.coronavirus),
          title: Text('Covid-19 Hotline'),
          trailing: Text('084 133'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.child_care),
          title: Text('Children Hotline'),
          trailing: Text('084 666'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.girl_outlined),
          title: Text('Gender Based Violence'),
          trailing: Text('084 706'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.dangerous),
          title: Text('Anti-Corruption'),
          trailing: Text('0800 701 701'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.stop),
          title: Text('Crime Stop (Anonymous)'),
          trailing: Text('086 001 0111'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.traffic),
          title: Text('Traffic Call Center'),
          trailing: Text('086 140 0800'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.water),
          title: Text('Water Department'),
          trailing: Text('080 020 0200'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
        const ListTile(
          leading: Icon(Icons.electrical_services),
          title: Text('Electricity Outages'),
          trailing: Text('081 409 2345'),
          iconColor: orangePeelForIconsAndButtons,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
