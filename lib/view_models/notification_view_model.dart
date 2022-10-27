import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/view_models/view_models.dart';

class NotificationViewModel {
  late PushNotificationsAPI  _pushService;
  late UserViewModel _userViewModel;
  late ReportsViewModel _reportsViewModel;

 NotificationViewModel(UserViewModel currentUserViewModel,ReportsViewModel currentReportsModel) {
   _userViewModel = currentUserViewModel;
   _reportsViewModel = currentReportsModel;
   _pushService = PushNotificationsAPI();
 }

  void pushToAdmins() {}

  void pushToUsers() {}

  void pushToRegion() {}
}