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
    _userReports.add(testReport1);
    _userReports.add(testReport2);
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
  Report testReport1 = Report(
      id: '23B4B549-90D5-49DB-B1F6-E995157B2F42',
      userName: 'TestUser3',
      title: 'Robbery Tip',
      description:
          'Suspect similiar to markups spotted near Absa bank. Seen driving a 1997 Toyota...',
      dateTime: DateTime.now(),
      isAlerted: false,
      isAcknowledged: false,
      locationData: Location('8010 Constantia Street'),
      media: [
        'https://st2.depositphotos.com/2101611/6966/v/450/depositphotos_69669865-stock-illustration-mugshot-of-anonymous-male-silhouette.jpg'
      ],
      region: Region(name: 'Welkom'),
      isImminent: false);
  Report testReport2 = Report(
      id: '23B5B549-91D5-49DB-B1F4-E487394B2F42',
      userName: 'TestUser5',
      title: 'Stolen item',
      description: 'Alone, No one injured, Security assistance needed',
      dateTime: DateTime.now(),
      isAlerted: false,
      isAcknowledged: false,
      locationData: Location('84 Jan Hofmeyer Road'),
      media: [
        'https://t3.ftcdn.net/jpg/04/79/14/04/360_F_479140492_IoZVw8cX4ujiQP2ik2hdelZ1nwORkBlF.jpg'
      ],
      region: Region(name: 'Welkom'),
      isImminent: true);
}
