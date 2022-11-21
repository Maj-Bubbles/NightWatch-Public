import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:provider/provider.dart';

class ReportsByUser extends StatefulWidget {
  const ReportsByUser({super.key});

  @override
  State<ReportsByUser> createState() => _ReportsByUserState();
}

class _ReportsByUserState extends State<ReportsByUser> {
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
        automaticallyImplyLeading: true,
        title: const Text(
          'My Reports',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: silverSandForFormsAndOtherStuff,
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text("$year-$month-$day"),
                      const SizedBox(
                        width: 90,
                      ),
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
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                imminent,
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
                        width: 30,
                      ),
                      Text("$hour:$minutes"),
                    ],
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
                        width: 40,
                      ),
                      Text(
                        location,
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
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text("- $selfReported"),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        "- $medicAndSecurity",
                        maxLines: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text("- $noOfPeople"),
                      const SizedBox(
                        width: 40,
                      ),
                      Text("- Status: $status"),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 1,
                          top: 10,
                          right: 8,
                          bottom: 10,
                        ),
                        child: MaterialButton(
                          color: redButtonColor,
                          highlightElevation: 20,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: silverSandForFormsAndOtherStuff,
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text("$year-$month-$day"),
                      const SizedBox(
                        width: 80,
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
                        width: 16,
                      ),
                      Text("$hour:$minutes"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: scaffoldBackgroundColor,
                        width: 330,
                        height: 230,
                        child: const Image(
                          image: AssetImage('media/Splash_GitHub_Page.png'),
                          width: 300,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: scaffoldBackgroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
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
                            navigatorService.navigateTo(RouteManager.moreDetailsNonImmPage);
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.pages,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'View more details',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
