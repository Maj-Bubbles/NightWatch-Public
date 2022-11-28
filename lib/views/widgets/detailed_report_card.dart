import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../miscellaneous/constants.dart';
import '../../models/report.dart';

class DetailedReportCard extends StatelessWidget {
  const DetailedReportCard({
    Key? key,
    required this.report,
    required this.index,
    required this.isAdmin,
  }) : super(key: key);

  final Report report;
  final int index;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: const Color.fromRGBO(183, 193, 192, 1),
                child: Padding(
                  //Padding for content inside Card()
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    //Column to contain Rows of content
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Row(
                        //row for Title, IsImminent bool icon, date and time
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${report.dateTime.year}-${report.dateTime.month}-${report.dateTime.day}'),
                          SizedBox(
                            //size of isImminent button/icon
                            height: 30,
                            width: 120,
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (report.isImminent) {
                                    return redButtonColor;
                                  } else {
                                    return tropicalForContainerAndButtonColor;
                                  }
                                }),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return Colors.white;
                                  },
                                ),
                              ),
                              onPressed: () {},
                              child: report.isImminent
                                  ? const Text('Imminent')
                                  : const Text('Non-imminent'),
                            ),
                          ),
                          Text(
                            DateFormat.Hm().format(report.dateTime),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: '',
                          children: [
                            //TODO: Read user name
                            const TextSpan(
                              text: 'Username: ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: report.userName,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      isAdmin
                          ? Text.rich(
                              TextSpan(
                                text: '',
                                children: [
                                  //TODO: Read user name
                                  const TextSpan(
                                    text: 'Full Names: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: report.userName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Container(),
                      isAdmin
                          ? Text.rich(
                              TextSpan(
                                text: '',
                                children: [
                                  TextSpan(
                                    text: isAdmin
                                        ? 'Company Telephone: '
                                        : 'Cellphone Number: ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: report.userName,
                                    //TODO: Read user number
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Container(),
                      isAdmin
                          ? Text.rich(
                              TextSpan(
                                text: '',
                                children: [
                                  TextSpan(
                                    text: isAdmin
                                        ? 'Admin Telephone: '
                                        : 'Emergency Number: ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: report.userName,
                                    //TODO: Read user number
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Container(),
                      Text.rich(
                        TextSpan(
                          text: '',
                          children: [
                            const TextSpan(
                              text: 'Region: ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: report.region.name,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        report.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(report.description),
                      const SizedBox(
                        height: 5,
                      ),
                      isAdmin
                          ? Column(
                              //row for admin buttons - Alert and Acknowledge
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
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
                                          width: 10,
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
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (report.isAcknowledged) {
                                        return Colors.grey;
                                      } else {
                                        return redButtonColor;
                                      }
                                      ;
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(Icons.logout),
                                      const SizedBox(
                                        width: 10,
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
            ],
          ),
          Center(
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
                      child: Image.asset(report.media.last),
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
