// import 'package:backendless_sdk/backendless_sdk.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:nightwatch/models/models.dart';
// import 'package:nightwatch/repositories/apis/backendless_apis.dart';
// import 'package:nightwatch/view_models/error_handling.dart';
//
// class MockBackendlessDataBaseAPI extends Mock
//     implements BackendlessDatabaseApi {}
//
// class MockBackendlessEventHandler extends Mock
//     implements EventHandler {}
//
// class MockBackendlessRealTimeAPI extends Mock
//     implements BackendlessRealTimeAPI {}
//
// void main() {
//   late MockBackendlessEventHandler eventHandler;
//   late MockBackendlessDataBaseAPI databaseMockApi;
//   late MockBackendlessRealTimeAPI realTimeMockApi;
//
//   final report = Report(
//       id: "",
//       userName: "Someone",
//       title: "Test",
//       description: "Testing",
//       dateTime: DateTime.now(),
//       isAlerted: false,
//       isAcknowledged: false,
//       locationData: Location()..location = "Welkom",
//       media: [""],
//       region: Region(name: ""),
//       isImminent: false);
//
//   final report1 = Report(
//       id: "",
//       userName: "Testing",
//       title: "Test",
//       description: "Testing",
//       dateTime: DateTime.now(),
//       isAlerted: false,
//       isAcknowledged: false,
//       locationData: Location()..location = "Doorn",
//       media: [""],
//       region: Region(name: ""),
//       isImminent: false);
//
//   setUp(() {
//     TestWidgetsFlutterBinding.ensureInitialized();
//     registerFallbackValue(BackendlessUser());
//     eventHandler = MockBackendlessEventHandler();
//     databaseMockApi = MockBackendlessDataBaseAPI();
//     realTimeMockApi = MockBackendlessRealTimeAPI();
//   });
//
//   test("Instance Of reports Service", () async {
//     when(() => realTimeMockApi.reportsEventHandler.addCreateListener((response) { }))
//         .thenReturn(EventHandler<Map<dynamic, dynamic>>("Report"));
//     reportsService = ReportsService(
//         databaseApi: databaseMockApi, realTimeAPI: realTimeMockApi);
//     // Act
//     expectLater(reportsService, isInstanceOf<ReportsService>());
//   });
//
//   group("get Reports", () {
//     setUpAll(() async {
//       TestWidgetsFlutterBinding.ensureInitialized();
//       registerFallbackValue(BackendlessUser());
//       eventHandler = MockBackendlessEventHandler();
//       databaseMockApi = MockBackendlessDataBaseAPI();
//       realTimeMockApi = MockBackendlessRealTimeAPI();
//     });
//
//     test("Success retrieval", () async {
//       // Arrange
//       when(() => realTimeMockApi.reportsEventHandler.addCreateListener((response) { }))
//           .thenReturn(EventHandler<Map<dynamic, dynamic>>("Report"));
//
//       reportsService = ReportsService(
//           databaseApi: databaseMockApi, realTimeAPI: realTimeMockApi);
//
//       // Act
//       when(() => databaseMockApi.retrieveReports()).thenAnswer((_) {
//         List<Map<dynamic, dynamic>> backendlessResponse = [
//           {
//             "objectId": "",
//             "Username": "Some username",
//             "Title": "What happened",
//             "Region": "Where in Welkom",
//             "Media": ["List of Links to evidence"],
//             "LocationData": "coordinates to scene",
//             "Imminent": false,
//             "Description": "Something in detail",
//             "DateTime": DateTime.now(),
//             "Alerted": false,
//             "Acknowledged": false,
//           },
//           {
//             "objectId": "",
//             "Username": "Some Name",
//             "Title": "Some Title",
//             "Region": "Doorn",
//             "Media": ["Link to Files"],
//             "LocationData": "-27.9831602,26.74847",
//             "Imminent": false,
//             "Description": "Something happened",
//             "DateTime": DateTime.now() as dynamic,
//             "Alerted": true,
//             "Acknowledged": true
//           },
//           {
//             "objectId": "",
//             "Username": "Ezra",
//             "Title": "Burglary",
//             "Region": "welkom",
//             "Media": ["Link to Files"],
//             "LocationData": "-27.9831602,26.74847",
//             "Imminent": false,
//             "Description": "Something else happened",
//             "DateTime": DateTime.now() as dynamic,
//             "Alerted": true,
//             "Acknowledged": true
//           }
//         ];
//         return Future.value(backendlessResponse);
//       }); // Assert
//
//       // Assert
//      expect(reportsService.getReports(), completion(isA<List<Report>>()));
//     });
//   });
//
//   group("Post Report", () {
//     test("Post Success", () async {
//       // Arrange
//
//       // Act
//       when(() => databaseMockApi.saveSingleReport(report))
//           .thenAnswer((_) => Future.value(true));
//       // Assert
//       expect(reportsService.storeReport(report),completion(equals(true)));
//     });
//
//     test("Post Failure", () async {
//       // Arrange
//
//       // Act
//       when(() => databaseMockApi.saveSingleReport(report)).thenThrow(
//           DataBaseAPIException(title: "Some Error Occurred", message: "Error"));
//
//       // Assert
//       await expectLater(reportsService.storeReport(report),
//           throwsA(isA<DataBaseAPIException>()));
//     });
//   });
// }
