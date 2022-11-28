import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/views/widgets/app_progress_indicator.dart';
import 'package:nightwatch/views/widgets/user_report-Cardv3LayoutGrid.dart';
import 'package:nightwatch/views/widgets/user_report_cardv2.dart';
import 'package:nightwatch/views/widgets/user_report_cardv3.dart';
import 'package:provider/provider.dart';
import '../../models/report.dart';
import '../widgets/user_report_card.dart';

class ReportsFeedScreen extends StatefulWidget {
  const ReportsFeedScreen({super.key});

  @override
  State<ReportsFeedScreen> createState() => _ReportsFeedScreenState();
}

class _ReportsFeedScreenState extends State<ReportsFeedScreen> {
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
        stream: reportsViewModel.getReports(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 1),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                print(snapshot.data?.docs[index].data());
                var report = Report.fromDocument(snapshot.data!.docs[index]);
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




/*            WWWWWEEEEERRRRRKKKKKKK
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/views/widgets/app_progress_indicator.dart';
import 'package:nightwatch/views/widgets/user_report-Cardv3LayoutGrid.dart';
import 'package:nightwatch/views/widgets/user_report_cardv2.dart';
import 'package:nightwatch/views/widgets/user_report_cardv3.dart';
import 'package:provider/provider.dart';
import '../../models/report.dart';
import '../widgets/user_report_card.dart';

class ReportsFeedScreen extends StatefulWidget {
  const ReportsFeedScreen({super.key});

  @override
  State<ReportsFeedScreen> createState() => _ReportsFeedScreenState();
}

class _ReportsFeedScreenState extends State<ReportsFeedScreen> {
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
        stream: reportsViewModel.getReports(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 1),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                print(snapshot.data?.docs[index].data());
                var report = Report.fromDocument(snapshot.data!.docs[index]);
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
 */






/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/views/widgets/app_progress_indicator.dart';
import 'package:nightwatch/views/widgets/login_form.dart';
import 'package:nightwatch/views/widgets/user_report_cardv2.dart';
import 'package:provider/provider.dart';
import '../../models/report.dart';
import '../widgets/user_report_card.dart';

class ReportsFeedScreen extends StatefulWidget {
  const ReportsFeedScreen({super.key});

  @override
  State<ReportsFeedScreen> createState() => _ReportsFeedScreenState();
}

class _ReportsFeedScreenState extends State<ReportsFeedScreen> {
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
        stream: reportsViewModel.getReports(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data?.docs[index].data());
                    var report =
                        Report.fromDocument(snapshot.data!.docs[index]);
                    reportsViewModel.reports.add(report);
                    print("Number of Reports: ${snapshot.data?.docs.length}");
                    return Container();
                  },
                ),
                Consumer<ReportsViewModel>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.reports.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          child: UserReportCardv2(
                            reports: value.reports,
                            index: index,
                            isAdmin: userViewModel.currentUser.isAdmin,
                          ),
                          onTap: () {
                            context.read<ReportsViewModel>().clickedReport =
                                reportsViewModel.reports[index];
                            navigatorService
                                .navigateTo(RouteManager.moreDetailsNonImmPage);
                          },
                        );
                      }),
                    );
                  },
                )
              ],
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
 */
