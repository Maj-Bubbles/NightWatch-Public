import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/views/widgets/test_data_class.dart';
import 'package:nightwatch/views/widgets/user_report-Cardv3LayoutGrid.dart';
import 'package:nightwatch/views/widgets/user_report_cardv2.dart';
import 'package:nightwatch/views/widgets/user_report_cardv3.dart';
import 'package:provider/provider.dart';
import '../../models/report.dart';
import '../widgets/user_report_card.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List<Report> reports = [];
  late bool isAdmin;

  // late ReportsViewModel viewModel;
  // late bool isAdminUser;
  @override
  void initState() {
    reports.add(TestData().testReport1);
    reports.add(TestData().testReport2);
    reports.add(TestData().testReport2);
    reports.add(TestData().testReport1);
    reports.add(TestData().testReport2);
    reports.add(TestData().testReport2);
    reports.add(TestData().testReport1);
    isAdmin = context.read<UserViewModel>().currentUser.isAdmin;
    super.initState();
  }

  getIsAdmin() async =>
      await context.read<UserViewModel>().checkIfUserIsAdmin();

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: reports.isEmpty
          ? const Center(
              child: Text(
              'No data to Display',
              style: TextStyle(color: Colors.white),
            ))
          : ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: UserReportCardv2(
                    reports: reports,
                    index: index,
                    isAdmin: isAdmin,
                  ),
                  onTap: () {
                    context.read<ReportsViewModel>().clickedReport =
                        reports[index];
                    navigatorService
                        .navigateTo(RouteManager.moreDetailsNonImmPage);
                  },
                );
              },
            ),
    );
  }
}

// ListView.builder(        Working 5th version - Listview on 4th
//               itemCount: reports.length,
//               itemBuilder: (context, index) {
//                 return LayoutGrid(
//                   columnSizes: [1.fr, 1.fr],
//                   rowSizes: const [auto, auto],
//                   columnGap: 5,
//                   rowGap: 15,
//                   children: [
//                     GestureDetector(
//                       child: UserReportCardv3LayoutGrid(
//                         report: reports[index],
//                         isAdmin: isAdmin,
//                       ),
//                       onTap: () {
//                         context.read<ReportsViewModel>().clickedReport =
//                             reports[index];
//                         navigatorService
//                             .navigateTo(RouteManager.moreDetailsNonImmPage);
//                       },
//                     )
//                   ],
//                 );
//               },
//               shrinkWrap: false,
//             ),








// LayoutGrid( refactored layoutgrid
//               columnSizes: [1.fr, 1.fr],
//               rowSizes: const [auto, auto],
//               columnGap: 5,
//               rowGap: 15,
//               children: [
//                 for (var report in reports)
//                   GestureDetector(
//                     child: UserReportCardv3LayoutGrid(
//                       report: report,
//                       isAdmin: isAdmin,
//                     ),
//                     onTap: () {
//                       context.read<ReportsViewModel>().clickedReport =
//                           reports[index];
//                       navigatorService
//                           .navigateTo(RouteManager.moreDetailsNonImmPage);
//                     },
//                   )
//               ],
//             ),

// LayoutGrid(  working package layoutgrid
//               columnSizes: [1.fr, 1.fr],
//               rowSizes: const [auto, auto],
//               columnGap: 5,
//               rowGap: 15,
//               children: [
//                 for (var i = 0; i < reports.length; i++)
//                   GestureDetector(
//                     child: UserReportCardv3(
//                       reports: reports,
//                       index: i,
//                       isAdmin: isAdmin,
//                     ),
//                     onTap: () {
//                       context.read<ReportsViewModel>().clickedReport =
//                           reports[i];
//                       navigatorService
//                           .navigateTo(RouteManager.moreDetailsNonImmPage);
//                     },
//                   )
//               ],
//             ),

// GridView.count(    semi working gridview with overflow
//               crossAxisCount: 2,
//               children: List.generate(reports.length, (index) {
//                 return GestureDetector(
//                   child: SizedBox(
//                     height: 500,
//                     child: UserReportCardv3(
//                       reports: reports,
//                       index: index,
//                       isAdmin: isAdmin,
//                     ),
//                   ),
//                   onTap: () {
//                     context.read<ReportsViewModel>().clickedReport =
//                         reports[index];
//                     navigatorService
//                         .navigateTo(RouteManager.moreDetailsNonImmPage);
//                   },
//                 );
//               }),
//             ),

// ListView.builder(    Original working listview
//               itemCount: reports.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   child: UserReportCardv3(
//                     reports: reports,
//                     index: index,
//                     isAdmin: isAdmin,
//                   ),
//                   onTap: () {
//                     context.read<ReportsViewModel>().clickedReport =
//                         reports[index];
//                     navigatorService
//                         .navigateTo(RouteManager.moreDetailsNonImmPage);
//                   },
//                 );
//               },
//             ),

// return GestureDetector(
//   child: UserReportCardv3(
//     reports: reports,
//     index: index,
//     isAdmin: isAdmin,
//   ),
//   onTap: () {
//     context.read<ReportsViewModel>().clickedReport =
//         reports[index];
//     navigatorService
//         .navigateTo(RouteManager.moreDetailsNonImmPage);
//   },
// );

// import 'package:flutter/material.dart';
// import 'package:nightwatch/routes/route_manager.dart';
// import 'package:nightwatch/services/navigation_and_dialog_service.dart';
// import 'package:nightwatch/view_models/view_models.dart';
// import 'package:nightwatch/views/widgets/test_data_class.dart';
// import 'package:nightwatch/views/widgets/user_report_cardv2.dart';
// import 'package:nightwatch/views/widgets/user_report_cardv3.dart';
// import 'package:provider/provider.dart';
// import '../../models/report.dart';
// import '../widgets/user_report_card.dart';

// class NewsFeed extends StatefulWidget {
//   const NewsFeed({super.key});

//   @override
//   State<NewsFeed> createState() => _NewsFeedState();
// }

// class _NewsFeedState extends State<NewsFeed> {
//   List<Report> reports = [];
//   late bool isAdmin;

//   // late ReportsViewModel viewModel;
//   // late bool isAdminUser;
//   @override
//   void initState() {
//     reports.add(TestData().testReport1);
//     reports.add(TestData().testReport2);
//     isAdmin = context.read<UserViewModel>().currentUser.isAdmin;
//     super.initState();
//   }

//   getIsAdmin() async =>
//       await context.read<UserViewModel>().checkIfUserIsAdmin();

//   @override
//   Widget build(BuildContext context) {
//     var navigatorService = context.read<NavigationAndDialogService>();

//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: reports.isEmpty
//           ? const Center(
//               child: Text(
//               'No data to Display',
//               style: TextStyle(color: Colors.white),
//             ))
//           : ListView.builder(
//               itemCount: reports.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   child: UserReportCardv3(
//                     reports: reports,
//                     index: index,
//                     isAdmin: isAdmin,
//                   ),
//                   onTap: () {
//                     context.read<ReportsViewModel>().clickedReport =
//                         reports[index];
//                     navigatorService
//                         .navigateTo(RouteManager.moreDetailsNonImmPage);
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }
