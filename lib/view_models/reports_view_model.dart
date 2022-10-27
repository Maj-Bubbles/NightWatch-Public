import 'package:nightwatch/repositories/reports_repository.dart';
import 'package:nightwatch/services/reports_service.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:nightwatch/models/models.dart';

class ReportsViewModel {
  late ReportsRepository reportsRepository;
  late UserViewModel userViewModel;
  late List<Report> userReports;
  Report? tempReport;

 ReportsViewModel() {
   reportsRepository = ReportsService();
   userViewModel = UserViewModel();
   userReports = [];
 }

  void postReport(Report report) {}
  dynamic getReports() {}
  dynamic getUserReports() {}
  void alertUsers() {}
}