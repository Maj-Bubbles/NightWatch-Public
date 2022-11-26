import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:provider/provider.dart';
import '../../miscellaneous/constants.dart';
import '../../models/report.dart';

class UserReportCardv3LayoutGrid extends StatelessWidget {
  const UserReportCardv3LayoutGrid({
    Key? key,
    required this.report,
    required this.isAdmin,
  }) : super(key: key);

  final Report report;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Padding for outside cards and spacing between
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: const Color.fromRGBO(183, 193, 192, 1),
                  child: Center(
                    child: Padding(
                      //Padding for content inside Card()
                      padding: const EdgeInsets.only(
                          bottom: 5, top: 5, left: 5, right: 5),
                      child: Column(
                        //Column to contain Rows of content
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Text(
                              report.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Column(
                              //row for date and time besides each side of the iconIsland
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    '${report.dateTime.year}-${report.dateTime.month}-${report.dateTime.day}'),
                                Text(
                                  DateFormat.Hm().format(report.dateTime),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              height: 100,
                              child: Text(
                                report.description,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          isAdmin
                              ? Column(
                                  //row for admin buttons - Alert and Acknowledge
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                            return orangePeelForIconsAndButtons;
                                          }),
                                          foregroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              return Colors.white;
                                            },
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(Icons.punch_clock),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Alert'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        )),
                                    TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (report.isAcknowledged) {
                                            return Colors.grey;
                                          } else {
                                            return redButtonColor;
                                          }
                                        }),
                                        foregroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            return Colors.white;
                                          },
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(Icons.logout),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          report.isAcknowledged
                                              ? const Text('Acknowledged')
                                              : const Text('Acknowledge'),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 12,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: report.isImminent
                      ? redButtonColor
                      : tropicalForContainerAndButtonColor),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(report.media[0]),
                      //Icon made by Rodrigo Guerios from www.flaticon.com
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
