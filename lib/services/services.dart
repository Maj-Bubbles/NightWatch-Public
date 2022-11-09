import 'package:get_it/get_it.dart';
import 'package:nightwatch/services/reports_service.dart';
import 'package:nightwatch/services/user_service.dart';

/// This burrell file exports all services using one
/// file together with the service Locator

export 'user_service.dart';
export 'reports_service.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // Register the Services to as a lazy singleton object.
  serviceLocator.registerLazySingleton<ReportsService>(() => ReportsService());
  serviceLocator.registerLazySingleton<UserService>(() => UserService());
}
