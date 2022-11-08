import 'package:nightwatch/models/models.dart';

abstract class ReportsRepository {
  dynamic getUserReports();

  dynamic storeReport(Report report);

  Stream<Report> get latestReport;

  dynamic getReports();
}