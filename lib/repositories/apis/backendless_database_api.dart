import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/services.dart';
import 'package:nightwatch/models/models.dart';

class BackendlessDatabaseApi {

  Future<bool> saveSingleReport(Report report) async {
    try {
      var serializedReport = report.toJson();
      await Backendless.data.of("Report").save(serializedReport);
      return true;
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "saveSingleReport");
    }
    return false;
  }

  Future<dynamic> retrieveReports() async {
    try {
      return await Backendless.data.of("Reports").find();
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "retrieveReports");
    }
  }

  Future<dynamic> retrieveUserReports() async {
    try {
      var userId = await Backendless.userService.getCurrentUser().then((value) =>  value?.getUserId());
      var query = DataQueryBuilder();
      query.properties = ["Reports"];
      return await Backendless.data.of("Users").findById(userId!, relations:["Reports"], queryBuilder: query);
    } on PlatformException catch (error, stackTrace) {
      _handleError(error, stackTrace, apiName: "retrieveUserReports");
    }
  }

  /// Code reuse: Handle API Errors and print details to the console
  /// throws an Exception to handled by a user of the api
  dynamic _handleError(PlatformException error, StackTrace stackTrace,
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
