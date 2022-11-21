import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:provider/provider.dart';

class MoreDetailsNonImm extends StatefulWidget {
  const MoreDetailsNonImm({super.key});

  @override
  State<MoreDetailsNonImm> createState() => _MoreDetailsNonImmState();
}

class _MoreDetailsNonImmState extends State<MoreDetailsNonImm> {
  int year = DateTime.utc(DateTime.now().microsecondsSinceEpoch).year;
  int month = DateTime.utc(DateTime.now().microsecondsSinceEpoch).month;
  int day = DateTime.utc(DateTime.now().microsecondsSinceEpoch).day;
  int hour = DateTime.utc(DateTime.now().microsecondsSinceEpoch).hour;
  int minutes = DateTime.utc(DateTime.now().microsecondsSinceEpoch).minute;

  String crimeType = 'Armed Robbery';
  String imminent = 'Imminent';
  String selfReported = 'Self Reported';
  String medicAndSecurity = 'Medical and Security';
  String noOfPeople = 'Single Person';
  String status = 'Active';
  String location = 'Welkom';
  String locationTwo = 'NostalgicHound462';
  String nonImminent = 'Non-Imminent';
  String title = 'Possible Arson Lead';
  String description =
      'Below the snowline, Caradhras is described as having dull red slopes, "as if stained with blood"...';

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Details',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Image(
            image: AssetImage('media/Splash_GitHub_Page.png'),
            width: 380,
            height: 380,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 1,
              top: 10,
              right: 8,
              bottom: 10,
            ),
            child: MaterialButton(
              color: tropicalForContainerAndButtonColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 5,
              onPressed: () {
               navigatorService.navigateTo(RouteManager.mapPage);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'View location on map',
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
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 3,
              bottom: 8,
            ),
            child: Card(
              color: silverSandForFormsAndOtherStuff,
              elevation: 5,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        crimeType,
                        style: const TextStyle(
                          color: scaffoldBackgroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("$year-$month-$day"),
                      const SizedBox(
                        width: 78,
                      ),
                      Text("$hour:$minutes"),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 1,
                          top: 10,
                          right: 8,
                          bottom: 10,
                        ),
                        child: MaterialButton(
                          color: tropicalForContainerAndButtonColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          elevation: 5,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                nonImminent,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Region: $location\n$locationTwo",
                        maxLines: 100,
                        style: const TextStyle(
                          color: scaffoldBackgroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        Text(
                          description,
                          maxLines: 2000,
                          softWrap: true,
                          style: const TextStyle(
                            color: scaffoldBackgroundColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
