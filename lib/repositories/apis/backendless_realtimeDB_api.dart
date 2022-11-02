import 'package:backendless_sdk/backendless_sdk.dart';

class BackendlessRealTimeAPI {
  final EventHandler<Map> reportsEventHandler = Backendless.data.of("Report").rt();
}