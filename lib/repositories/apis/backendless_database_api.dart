import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/services.dart';
import 'package:nightwatch/models/models.dart';

class BackendlessDatabaseApi {
  Backendless backendlessDatabaseApi = Backendless();

  void saveSingleReport(Report report) {
    var serializedReport = {
      "Username": report.userName,
      "Title": report.title,
      "Description": report.description,
      "DateTime": report.dateTime,
      "Alerted": report.isAlerted,
      "Acknowledged": report.isAcknowledged,
      "Imminent": report.isImminent,
      "LocationData": report.locationData,
      "Media": {report.dateTime: report.media},
    };
    Backendless.data.of("Report").save(serializedReport).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "saveSingleReport"));
  }

  dynamic retrieveUserReports(String keyword) {
    var query = DataQueryBuilder()..whereClause = "Reports";
    return Backendless.data.of("Users").find(query).catchError(
        (error, stackTrace) =>
            _handleError(error, stackTrace, apiName: "retrieveUserReports"));
  }

  /// Code reuse: Handle API Errors and print details to the console
  /// throws an Exception to handled by a user of the api
  _handleError(PlatformException error, StackTrace stackTrace,
      {required String apiName}) {
    _logException(error, stackTrace, apiName);
    throw BackendlessException(error.details, error.code as int);
  }

  /// Prints error information of a Backendless API error
  /// to the console for ease of debugging
  void _logException(
      PlatformException error, StackTrace stackTrace, String apiName) {
    print("Backendless API Error: $apiName");
    print("exception code: ${error.code}");
    print("exception details: ${error.details}");
    print("stacktrace: $stackTrace");
  }
}
