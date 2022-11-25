import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/services.dart';
import 'package:provider/provider.dart';

class NonImminentCard extends StatelessWidget {
  final Report report;
  const NonImminentCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Padding(
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
                Text("${report.dateTime}"),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 1,
                    top: 5,
                    right: 8,
                    bottom: 5,
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
                      children: const [
                        Text(
                          "NonImminent",
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
                // const SizedBox(
                //   width: 8,
                // ),
                // Text("${report.dateTime}"),
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
                    image:
                    AssetImage('media/Splash_GitHub_Page.png'),
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
                  report.title,
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
                      navigatorService.navigateTo(
                          RouteManager.moreDetailsNonImmPage);
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
    );
  }
}

class ImminentCard extends StatelessWidget {
  final Report report;
  const ImminentCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Padding(
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
                Text("${report.dateTime}"),
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
                      children: const [
                        Text(
                          "Imminent",
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
                const SizedBox(
                  width: 30,
                ),
                Text("${report.dateTime}"),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "CrimeType",
                  style: TextStyle(
                    color: scaffoldBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  "${report.locationData.location}",
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
                Text("- ${report.userName}"),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  "Not Alerted: ${report.isAlerted}",
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
                Text("- Region: ${report.region}"),
                const SizedBox(
                  width: 40,
                ),
                Text("- Status: ${report.isAcknowledged}"),
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
                      navigatorService
                          .navigateTo(RouteManager.mapPage);
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
    );
  }
}

