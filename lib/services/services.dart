import 'package:get_it/get_it.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/services/reports_service.dart';
import 'package:nightwatch/services/user_service.dart';
import 'navigation_and_dialog_service.dart';

/// This burrell file exports all services using one
/// file together with the service Locator

export 'user_service.dart';
export 'reports_service.dart';
export 'navigation_and_dialog_service.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // Register the Services to as a lazy singleton object.
  serviceLocator.registerLazySingleton<ReportsService>(() => ReportsService());
  //TODO: Ask Matsilla on line 18 and 19: Too many positional arguments: 0 expected, but 1 found.
  //Try removing the extra arguments.
  serviceLocator.registerLazySingleton<UserService>(() => UserService());
  serviceLocator.registerLazySingleton<NavigationAndDialogService>(
      () => NavigationAndDialogService());
}
