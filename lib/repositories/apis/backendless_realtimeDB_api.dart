import 'package:backendless_sdk/backendless_sdk.dart';

class BackendlessRealTimeAPI {
  late final EventHandler<Map> reportsEventHandler;
  BackendlessRealTimeAPI() {
    reportsEventHandler = Backendless.data.of("Report").rt();
  }
}