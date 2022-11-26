import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/services/firebase_reports_service.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/base_view_model.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:nightwatch/models/models.dart';

class ReportsViewModel extends BaseViewModel {
  late FirebaseReportsService _reportsService;
  late UserViewModel userViewModel;
  List<Report> reports = [];
  late StreamSubscription<List<Report>> newReport;
  final nonImReportFormKey = GlobalKey<FormState>();

  // The limit of reports to fetch
  int limit = 20;

  //Clicked report repository of sort for details page
  Report clickedReport = Report(
      id: '',
      userName: '',
      title: '',
      description: '',
      dateTime: DateTime.now(),
      isAlerted: false,
      isAcknowledged: false,
      locationData: Location(),
      media: [],
      region: Region(name: 'Welkom'),
      isImminent: false);

// Dropdown menu item list for non-imminent report page
  final List<DropdownMenuItem<String>> items = [
    'Welkom',
    'Riebeeckstad',
    'Naudeville',
    'St Helena',
    'Bedelia',
    'Reitzpark',
    'Doorn',
    'Flamingo Park',
    'Dagbreek',
    'Virginia',
    'Harmony',
    'Saaiplaas',
    'Merriespruit',
    'Panorama',
    'Kitty',
    'Meloding',
    'Thabong'
        'Jan Cilliers Park',
    'Seemeeu Park',
    'Koppie Alleen',
  ].map<DropdownMenuItem<String>>((item) {
    return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }).toList();

  //selected value for region dropdown on NonImminent report screen
  String _selectedValue = '';
  String get selectedValue => _selectedValue;
  set selectedValue(String param) {
    _selectedValue = param;
    notifyListeners();
  }

  // Dropdown menu item list for IMMINENT report page
  final List<DropdownMenuItem<String>> itemsImminent = [
    'Welkom',
    'Riebeeckstad',
    'Naudeville',
    'St Helena',
    'Bedelia',
    'Reitzpark',
    'Doorn',
    'Flamingo Park',
    'Dagbreek',
    'Virginia',
    'Harmony',
    'Saaiplaas',
    'Merriespruit',
    'Panorama',
    'Kitty',
    'Meloding',
    'Thabong'
        'Jan Cilliers Park',
    'Seemeeu Park',
    'Koppie Alleen',
  ].map<DropdownMenuItem<String>>((item) {
    return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }).toList();

  //selected value for region dropdown on NonImminent report screen
  String _selectedImmValue = '';
  String get selectedImmValue => _selectedImmValue;
  set selectedImmValue(String param) {
    _selectedImmValue = param;
    notifyListeners();
  }

  // Dropdown menu item list for IMMINENT report page
  final List<DropdownMenuItem<String>> itemsCrime = [
    'Assault',
    'Aggravating circumstances',
    'Breaking and Entering',
    'Kidnapping',
    'Arson',
    'Property Crime',
    'Weapon discharge',
    'DUI',
  ].map<DropdownMenuItem<String>>((item) {
    return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }).toList();

  //selected value for region dropdown on NonImminent report screen
  String _selectedCrimeValue = '';
  String get selectedCrimeValue => _selectedCrimeValue;
  set selectedCrimeValue(String param) {
    _selectedCrimeValue = param;
    notifyListeners();
  }

//following getters and setters for buttons on imminent reporting screen
  String _whoInDangValue = '';
  String get whoInDangValue => _whoInDangValue;
  set whoInDangValue(String param) {
    _whoInDangValue = param;
    notifyListeners();
  }

  String _affectedIndValue = '';
  String get affectedIndValue => _affectedIndValue;
  set affectedIndValue(String param) {
    _affectedIndValue = param;
    notifyListeners();
  }

  String _assistanceNeedValue = '';
  String get assistanceNeedValue => _assistanceNeedValue;
  set assistanceNeedValue(String param) {
    _assistanceNeedValue = param;
    notifyListeners();
  }

  String _incidentStatValue = '';
  String get incidentStatValue => _incidentStatValue;
  set incidentStatValue(String param) {
    _incidentStatValue = param;
    notifyListeners();
  }

//constructor
  ReportsViewModel(FirebaseReportsService reportsService) {
    _reportsService = reportsService;
  }

  Stream<QuerySnapshot> getReports() {
    return _reportsService.getReportsStream(limit);
  }

//helper to initialise a report object for postReport(Report)
  postReportHelper(
      {required String username,
      required String title,
      required String description,
      required DateTime dateTime,
      required String locationString,
      required String mediaString,
      required String regionString,
      required bool isImminent}) async {
    if (nonImReportFormKey.currentState?.validate() ?? false) {
      Location locationData = Location(locationString);
      List<String> media = [mediaString];
      Region region = Region(name: regionString);
      Report report = Report(
          id: userViewModel.currentUser.id,
          userName: username,
          title: title,
          description: description,
          dateTime: dateTime,
          isAlerted: false,
          isAcknowledged: false,
          locationData: locationData,
          media: media,
          region: region,
          isImminent: isImminent);

      await postReport(report, report.id);
    }
  }

  Future<void> postReport(Report report, String userId) async {
    try {
      setState(ViewState.Busy);
      await _reportsService.storeReport(report, userId);
      setState(ViewState.Success);
    } on DataBaseAPIException catch (error) {
      setErrorDialog(error);
      setState(ViewState.Error);
    }
  }

  Stream<QuerySnapshot> getUserReports(String userId) {
      return _reportsService.getUserReports(limit,userId);
  }

  //TODO: Implement Notification View Model
  void alertUsers() {}

  /*
  Test reports added for development on the cards
  -testReport1
  -testReport2
  Both are added in the constructor ReportsViewModel() - LINE 23 & 24
  */

}
