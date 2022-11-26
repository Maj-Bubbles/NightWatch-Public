import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:provider/provider.dart';
import '../../models/report.dart';
import '../widgets/user_report_card.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
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
            if ((snapshot.data?.docs.length ?? 0) > 0) {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  print(snapshot.data?.docs[index].data());
                  var report = Report.fromDocument(snapshot.data!.docs[index]);
                  reportsViewModel.reports.add(report);
                  print("Number of Reports: ${snapshot.data?.docs.length}");
                  return GestureDetector(
                    child: UserReportCard(
                      reports: reportsViewModel.reports,
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
                },
              );
            } else {
              return const Center(
                child: Text(
                  "No reports",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          } else if (snapshot.hasError) {
            print("An Error Occurred: ${snapshot.error}");
            // navigatorService.showSnackBar(StatusDialog(title: snapshot.error, message: snapshot.error.message))
          }
          return Container();
        });
  }
}
