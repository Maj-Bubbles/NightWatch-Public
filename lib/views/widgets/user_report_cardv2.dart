import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../miscellaneous/constants.dart';
import '../../models/report.dart';

class UserReportCardv2 extends StatelessWidget {
  const UserReportCardv2({
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
              Card(
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
                        Row(
                          //row for date and time besides each side of the iconIsland
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${reports[index].dateTime.year}-${reports[index].dateTime.month}-${reports[index].dateTime.day}'),
                            Text(
                              DateFormat.Hm().format(reports[index].dateTime),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          reports[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(reports[index].description),
                        const SizedBox(
                          height: 5,
                        ),
                        isAdmin
                            ? Row(
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
            ],
          ),
          Center(
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
                      child: Image.asset(reports[index].media.last),
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












// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../../miscellaneous/constants.dart';
// import '../../models/report.dart';

// class UserReportCardv2 extends StatelessWidget {
//   const UserReportCardv2({
//     Key? key,
//     required this.reports,
//     required this.index,
//     required this.isAdmin,
//   }) : super(key: key);

//   final List<Report> reports;
//   final int index;
//   final bool isAdmin;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       //Padding for outside cards and spacing between
//       padding: const EdgeInsets.all(5),
//       child: Container(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 const SizedBox(height: 50),
//                 Card(
//                   clipBehavior: Clip.antiAlias,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   color: const Color.fromRGBO(183, 193, 192, 1),
//                   child: Center(
//                     child: Stack(
//                       children: [
//                         Padding(
//                           //Padding for content inside Card()
//                           padding: const EdgeInsets.only(
//                               bottom: 5, top: 100, left: 5, right: 5),
//                           child: Column(
//                             //Column to contain Rows of content
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 //row for Title, IsImminent bool icon, date and time
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                       '${reports[index].dateTime.year}-${reports[index].dateTime.month}-${reports[index].dateTime.day}'),
//                                   SizedBox(
//                                     //size of isImminent button/icon
//                                     height: 30,
//                                     width: 120,
//                                     child: TextButton(
//                                       style: ButtonStyle(
//                                         shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                           RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(18.0),
//                                           ),
//                                         ),
//                                         backgroundColor: MaterialStateProperty
//                                             .resolveWith<Color>(
//                                                 (Set<MaterialState> states) {
//                                           if (reports[index].isImminent) {
//                                             return redButtonColor;
//                                           } else {
//                                             return tropicalForContainerAndButtonColor;
//                                           }
//                                         }),
//                                         foregroundColor: MaterialStateProperty
//                                             .resolveWith<Color>(
//                                           (Set<MaterialState> states) {
//                                             return Colors.white;
//                                           },
//                                         ),
//                                       ),
//                                       onPressed: () {},
//                                       child: reports[index].isImminent
//                                           ? const Text('Imminent')
//                                           : const Text('Non-imminent'),
//                                     ),
//                                   ),
//                                   Text(
//                                     DateFormat.Hm()
//                                         .format(reports[index].dateTime),
//                                     textAlign: TextAlign.center,
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Center(
//                                 // child: CachedNetworkImage(imageUrl: reports[index].media[0]),
//                                 child: Image.network(
//                                   reports[index].media[0],
//                                   frameBuilder: (context, child, frame,
//                                       wasSynchronouslyLoaded) {
//                                     return child;
//                                   },
//                                   loadingBuilder:
//                                       (context, child, loadingProgress) {
//                                     if (loadingProgress == null) {
//                                       return child;
//                                     } else {
//                                       // return Image.asset('media/Splash_GitHub_Page.png');
//                                       return Center(
//                                         child: CircularProgressIndicator(
//                                           value: loadingProgress
//                                                       .expectedTotalBytes !=
//                                                   null
//                                               ? loadingProgress
//                                                       .cumulativeBytesLoaded /
//                                                   loadingProgress
//                                                       .expectedTotalBytes!
//                                               : null,
//                                         ),
//                                       );
//                                     }
//                                   },
//                                   errorBuilder: (context, error, stackTrace) {
//                                     return const Icon(
//                                       Icons.error,
//                                       size: 50,
//                                       color: Colors.red,
//                                     );
//                                   },
//                                   height: 150,
//                                   width: 300,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 reports[index].title,
//                                 style: const TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Text(reports[index].description),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               isAdmin
//                                   ? Row(
//                                       //row for admin buttons - Alert and Acknowledge
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextButton(
//                                             style: ButtonStyle(
//                                               shape: MaterialStateProperty.all<
//                                                   RoundedRectangleBorder>(
//                                                 RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           18.0),
//                                                 ),
//                                               ),
//                                               backgroundColor:
//                                                   MaterialStateProperty
//                                                       .resolveWith<Color>((Set<
//                                                               MaterialState>
//                                                           states) {
//                                                 return orangePeelForIconsAndButtons;
//                                               }),
//                                               foregroundColor:
//                                                   MaterialStateProperty
//                                                       .resolveWith<Color>(
//                                                 (Set<MaterialState> states) {
//                                                   return Colors.white;
//                                                 },
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: const [
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Icon(Icons.punch_clock),
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text('Alert'),
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                               ],
//                                             )),
//                                         TextButton(
//                                           style: ButtonStyle(
//                                             shape: MaterialStateProperty.all<
//                                                 RoundedRectangleBorder>(
//                                               RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(25.0),
//                                               ),
//                                             ),
//                                             backgroundColor:
//                                                 MaterialStateProperty
//                                                     .resolveWith<Color>(
//                                                         (Set<MaterialState>
//                                                             states) {
//                                               if (reports[index]
//                                                   .isAcknowledged) {
//                                                 return Colors.grey;
//                                               } else {
//                                                 return redButtonColor;
//                                               }
//                                             }),
//                                             foregroundColor:
//                                                 MaterialStateProperty
//                                                     .resolveWith<Color>(
//                                               (Set<MaterialState> states) {
//                                                 return Colors.white;
//                                               },
//                                             ),
//                                           ),
//                                           onPressed: () {},
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                               const Icon(Icons.logout),
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                               reports[index].isAcknowledged
//                                                   ? const Text('Acknowledged')
//                                                   : const Text('Acknowledge'),
//                                               const SizedBox(
//                                                 width: 5,
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   : Container(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               bottom: 300,
//               left: MediaQuery.of(context).size.width / 2.5,
//               child: Container(
//                 width: 80,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.orange,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 60,
//                     decoration: const BoxDecoration(shape: BoxShape.circle),
//                     child: Image.asset('media/crime-investigation.png'),
//                     //Icon made by Rodrigo Guerios from www.flaticon.com
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
