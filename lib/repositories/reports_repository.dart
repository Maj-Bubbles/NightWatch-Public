import 'package:nightwatch/models/models.dart';

abstract class ReportsRepository {
  dynamic getUserReports();

  dynamic storeReport(Report report);

  Stream<List<Report>> get latestReport;

  dynamic getReports();
}