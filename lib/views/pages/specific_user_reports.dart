import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/views/widgets/app_progress_indicator.dart';
import 'package:nightwatch/views/widgets/user_report-Cardv3LayoutGrid.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../view_models/view_models.dart';

class ReportsByUser extends StatefulWidget {
  const ReportsByUser({super.key});

  @override
  State<ReportsByUser> createState() => _ReportsByUserState();
}

class _ReportsByUserState extends State<ReportsByUser> {
  late ReportsViewModel reportsViewModel;
  late UserViewModel userViewModel;

  @override
  void initState() {
    reportsViewModel = context.read<ReportsViewModel>();
    userViewModel = context.read<UserViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return StreamBuilder<QuerySnapshot>(
        stream: reportsViewModel
            .getUserReports(context.read<UserViewModel>().currentUser.id),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return context.read<UserViewModel>().currentUser.isAdmin
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            childAspectRatio: 0.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 1),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      print(snapshot.data?.docs[index].data());
                      var report =
                          Report.fromDocument(snapshot.data!.docs[index]);
                      reportsViewModel.reports.add(report);
                      print("Number of Reports: ${snapshot.data?.docs.length}");
                      return GestureDetector(
                        child: UserReportCardv3LayoutGrid(
                          report: reportsViewModel.reports[index],
                          isAdmin: userViewModel.currentUser.isAdmin,
                        ),
                        onTap: () {
                          context.read<ReportsViewModel>().clickedReport =
                              reportsViewModel.reports[index];
                          navigatorService
                              .navigateTo(RouteManager.moreDetailsNonImmPage);
                        },
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 1),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      print(snapshot.data?.docs[index].data());
                      var report =
                          Report.fromDocument(snapshot.data!.docs[index]);
                      reportsViewModel.reports.add(report);
                      print("Number of Reports: ${snapshot.data?.docs.length}");
                      return GestureDetector(
                        child: UserReportCardv3LayoutGrid(
                          report: reportsViewModel.reports[index],
                          isAdmin: userViewModel.currentUser.isAdmin,
                        ),
                        onTap: () {
                          context.read<ReportsViewModel>().clickedReport =
                              reportsViewModel.reports[index];
                          navigatorService
                              .navigateTo(RouteManager.moreDetailsNonImmPage);
                        },
                      );
                    },
                  );
          } else if (!snapshot.hasData) {
            return const Center(
                child: LoadingIndicatorV2(text: 'Fetching Reports'));
          } else if (snapshot.hasError) {
            print("An Error Occurred: ${snapshot.error}");
            // navigatorService.showSnackBar(StatusDialog(title: snapshot.error, message: snapshot.error.message))
          }
          return Container();
        });
  }
}
