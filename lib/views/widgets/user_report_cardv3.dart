import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../miscellaneous/constants.dart';
import '../../models/report.dart';

class UserReportCardv3 extends StatelessWidget {
  const UserReportCardv3({
    Key? key,
    required this.reports,
    required this.index,
    required this.isAdmin,
  }) : super(key: key);

  final List<Report> reports;
  final int index;
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
                              reports[index].title,
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
                                    '${reports[index].dateTime.year}-${reports[index].dateTime.month}-${reports[index].dateTime.day}'),
                                Text(
                                  DateFormat.Hm()
                                      .format(reports[index].dateTime),
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
                                reports[index].description,
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
                                          if (reports[index].isAcknowledged) {
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
                                          reports[index].isAcknowledged
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
                  color: reports[index].isImminent
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
                      child: Image.asset(reports[index].media[1]),
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
