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
  Report? _newReport;

  // Usage of this value is through a database
  // event thus its null should not occur.
  Report get newReport => _newReport!;
  List<Report> get userReports => _userReports;

  ReportsViewModel(ReportsService reportsService) {
    _reportsService = _reportsService;
    _reportsService.latestReport.listen(_latestUpdate);
  }

  void _latestUpdate(Report report) {
    _newReport = report; // Set the newReport for the UI
    setState(ViewState.DataFetched); // Update the View
  }

  Future<void> getReports() async {
    try {
      setState(ViewState.Busy);
      _userReports = await _reportsService.getReports();
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

  /*
  Test reports added for development on the cards
  -testReport1
  -testReport2
  Both are added in the constructor ReportsViewModel() - LINE 23 & 24
  */

}
