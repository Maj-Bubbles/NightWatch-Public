import 'package:nightwatch/models/models.dart';

abstract class ReportsRepository {
  List<Report> getUserReports(User user);

  String storeReport(User user);

  Report getReport(String reportId);

  List<Report> getReports(List<String> reportIDs);
}