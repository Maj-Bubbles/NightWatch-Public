import 'package:backendless_sdk/backendless_sdk.dart';

class BackendlessRealTimeAPI {
  late final EventHandler<Map> _reportsEventHandler;
  EventHandler<Map> get reportsEventHandler => _reportsEventHandler;

  BackendlessRealTimeAPI({required EventHandler<Map> reportsHandler}) {
    _reportsEventHandler = reportsHandler;
  }
}