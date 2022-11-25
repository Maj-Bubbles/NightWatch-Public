import 'dart:async';

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/repositories/reports_repository.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/base_view_model.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:nightwatch/models/models.dart';

class ReportsViewModel extends BaseViewModel {
  late ReportsRepository _reportsService;
  late UserViewModel userViewModel;
  late List<Report> _userReports;
  List<Report> reports = [];
  late StreamSubscription<List<Report>> newReport;

  // Usage of this value is through a database
  // event thus its null should not occur.
  // Report get newReport => _newReport!;
  List<Report> get userReports => _userReports;

  ReportsViewModel(ReportsService reportsService) {
    _reportsService = reportsService;
    _reportsService.latestReport.listen(_latestUpdate);
    getReports();
  }

  void _latestUpdate(List<Report> reports) {
    setState(ViewState.Busy);
    reports.addAll(reports);
    print(reports);
    // _newReport = report!; // Set the newReport for the UI
    setState(ViewState.DataFetched); // Update the View
  }

  Future<void> getReports() async {
    try {
      setState(ViewState.Busy);
      reports = await _reportsService.getReports();
      print(reports);
      setState(ViewState.DataFetched);
    } on BackendlessException catch (_) {
      // Error Dialog
    }
  }

  Future<void> postReport(Report report) async {
    try {
      await _reportsService.storeReport(report);
      setState(ViewState.Success);
    } catch (_) {}
  }

  Future<void> getUserReports() async {
    try {
      setState(ViewState.Busy);
      _userReports = await _reportsService.getUserReports();
      setState(ViewState.Success);
    } on BackendlessException catch (_) {}
  }

  //TODO: Implement Notification View Model
  void alertUsers() {}
}
