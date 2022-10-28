import 'package:nightwatch/models/report.dart';
import 'package:nightwatch/models/user.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/repositories/reports_repository.dart';

class ReportsService extends ReportsRepository {
  late final databaseAPI;
  late final realTimeDB;

  ReportsService() {
    databaseAPI = BackendlessDatabaseApi();
    realTimeDB = BackendlessRealTimeAPI();
  }

  @override
  Report getReport(String reportId) {
    // TODO: implement getReport
    throw UnimplementedError();
  }

  @override
  List<Report> getReports(List<String> reportIDs) {
    // TODO: implement getReports
    throw UnimplementedError();
  }

  @override
  List<Report> getUserReports(User user) {
    // TODO: implement getUserReports
    throw UnimplementedError();
  }

  @override
  String storeReport(User user) {
    // TODO: implement storeReport
    throw UnimplementedError();
  }

  fromJson(String json) {}

  toJson(List<String> reports) {}
  
}