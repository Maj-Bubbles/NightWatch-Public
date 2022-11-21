import 'package:flutter/material.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/models/models.dart';

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  /// This dialog field is set alert the user of any failures
  /// or operation success.
  StatusDialog _dialog = StatusDialog(title: "", message: "");
  StatusDialog get errorDialog => _dialog;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }

  void setViewStateToIdle() => _state = ViewState.Idle;

  void setErrorDialog(NighWatchException error) {
    _dialog = StatusDialog(title: error.title, message: error.message);
  }

}
