import 'dart:async';

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:nightwatch/models/report.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/repositories/reports_repository.dart';

class ReportsService extends ReportsRepository {
  late final StreamController<Report> _realTimeReports;

  @override
  Stream<Report> get latestReport => _realTimeReports.stream;


  late List<Report> _reports;
  late List<Report> _userReports;

  List<Report> get reports => _reports;
  List<Report> get userReports => _userReports;

  ReportsService() {
    _reports = [];
    _userReports = [];
    // Asynchronous data structure to channel streamed
    // latest reports
    _realTimeReports = StreamController<Report>();
    // start listening for a New report
    BackendlessRealTimeAPI().reportsEventHandler.addCreateListener((newReport) {
      _realTimeReports.add(Report.fromJson(newReport));
  });
  }

  // Unconditional retrieval of reports
  @override
  Future<void> getReports() async {
    try {
      // TODO: Paginate retrieved reports
      // in order to be memory efficient
      List<Map<dynamic, dynamic>> retrievedReports = await BackendlessDatabaseApi.retrieveReports();
      retrievedReports.map((json) => Report.fromJson(json)).toList();
    } on BackendlessException catch (_) {
      // To be handled by the ViewModel
        rethrow;
    }
  }

  @override
  Future<void> getUserReports() async {
    try {

     List<Map<dynamic, dynamic>> retrievedUserReports = await BackendlessDatabaseApi.retrieveUserReports();
     //Convert JSON formatted reports to Report objects
     // store to local user reports variable.
     _userReports = retrievedUserReports.map((json) => Report.fromJson(json)).toList();

    } on BackendlessException catch (_) {
      // To be handled by the ViewModel
      rethrow;
    }
  }

  @override
  Future<void> storeReport(Report report) async {
    try {
      await BackendlessDatabaseApi.saveSingleReport(report);
    } on BackendlessException catch(_) {
      // To be handled by the ViewModel
      rethrow;
    }
  }
}