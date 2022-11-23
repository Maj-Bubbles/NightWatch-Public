import 'package:flutter/material.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:nightwatch/views/widgets/test_data_class.dart';
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
    isAdmin = true;
    // viewModel = context.read<ReportsViewModel>();
    // reports = viewModel.userReports;
    // isAdminUser =
    //     context.read<UserViewModel>().currentUser.properties['isAdmin'] as bool;
    // isAdminUser = getIsAdmin() as bool;
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
                return UserReportCard(
                  reports: reports,
                  index: index,
                  isAdmin: isAdmin,
                );
              },
            ),
    );
  }
}
