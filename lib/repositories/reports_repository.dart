import 'package:nightwatch/models/models.dart';

abstract class ReportsRepository {
  dynamic getUserReports();

  dynamic storeReport(Report report);

  dynamic getReport(String reportId);

  dynamic getReports(List<String> reportIDs);
}