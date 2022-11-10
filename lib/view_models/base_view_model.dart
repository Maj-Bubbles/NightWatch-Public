import 'package:flutter/material.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  /// This dialog field is set alert the user of any failures
  /// or operation success.
  StatusDialog _dialog = StatusDialog(title: "", message: "");
  StatusDialog get dialog => _dialog;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }

  void setErrorDialog(NighWatchException error) {
    _dialog = StatusDialog(title: error.title, message: error.message);
  }

}



/// A value mapping the View UI to the state in the Model.
///
/// This will contain all the possible states for any view, custom enums can be created for separate views if required
enum ViewState {
  Idle, // When nothing is happening or just initialized
  Busy, // Typically shows a loading indicator of some sorts
  DataFetched, // Indicates that there's data available on the view
  NoDataAvailable, // Indicates that data was fetched successfully but nothing is available
  Error, // Indicates there's an error on the view
  Success, // Successful action occurred
  WaitingForInput // The starting state that a form view is in
}
