import 'dart:async';

import 'package:nightwatch/models/report.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/repositories/reports_repository.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class ReportsService extends ReportsRepository {
  late final StreamController<Report> _realTimeReports;
  late final BackendlessDatabaseApi _dataBaseApi;
  late final BackendlessRealTimeAPI _realTimeApi;

  @override
  Stream<Report> get latestReport => _realTimeReports.stream;


  ReportsService({required BackendlessDatabaseApi databaseApi, required BackendlessRealTimeAPI realTimeAPI}) {
    _dataBaseApi = databaseApi;
    _realTimeApi = realTimeAPI;
    // Asynchronous data structure to channel streamed
    // latest reports
    _realTimeReports = StreamController<Report>();
    // start listening for a New report
    _realTimeApi.reportsEventHandler.addCreateListener(_addLatestReportToController);
  }

  void _addLatestReportToController(Map newReport) =>
      _realTimeReports.add(Report.fromJson(newReport));

  // Unconditional retrieval of reports
  @override
  Future<List<Report>> getReports() async {
    try {
      List<Map<dynamic, dynamic>> retrievedReports = await _dataBaseApi.retrieveReports();

      return retrievedReports.map((json) => Report.fromJson(json)).toList();
    } on DataBaseAPIException catch (_) {
      // To be handled by the ViewModel
        rethrow;
    }
  }

  @override
  Future<List<Report>> getUserReports() async {
    try {

     List<Map<dynamic, dynamic>> retrievedUserReports = await _dataBaseApi.retrieveUserReports();
     //Convert JSON formatted reports to Report objects
     // store to local user reports variable.
     return retrievedUserReports.map((json) => Report.fromJson(json)).toList();

    } on DataBaseAPIException catch (_) {
      // To be handled by the ViewModel
      rethrow;
    }
  }

  @override
  Future<bool> storeReport(Report report) async {
    try {
     return await _dataBaseApi.saveSingleReport(report);
    } on DataBaseAPIException catch (_) {
      // To be handled by the ViewModel
      rethrow;
    }
  }
}