import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nightwatch/services/firebase_reports_service.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/base_view_model.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:nightwatch/models/models.dart';

class ReportsViewModel extends BaseViewModel {
  late FirebaseReportsService _reportsService;
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
    'Thabong',
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

  //selected value for region dropdown on Imminent report screen
  String _selectedImmValue = '';
  String get selectedImmValue => _selectedImmValue;
  set selectedImmValue(String param) {
    _selectedImmValue = param;
    notifyListeners();
  }

  // Dropdown menu title list for IMMINENT report page - (Title selector)
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

  //selected value for crime title on IMMINENT screen
  String _selectedCrimeValue = '';
  String get selectedCrimeValue => _selectedCrimeValue;
  set selectedCrimeValue(String param) {
    _selectedCrimeValue = param;
    notifyListeners();
  }

  //For Dropdown on NON-Imminent reporting - (Icon Selector)
  final List<DropdownMenuItem<String>> iconCrime = [
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
          style: const TextStyle(fontSize: 20),
        ));
  }).toList();

  //selected value for icon selector dropdown on NonImminent report screen
  String _selecIconCrime = 'media/crime-investigation.png';
  String get selecIconCrime => _selecIconCrime;
  set selecIconCrime(String iconval) {
    switch (iconval) {
      case 'Assault':
        _selecIconCrime = 'media/assault.png';
        notifyListeners();
        break;
      case 'Aggravating circumstances':
        _selecIconCrime = 'media/aggravated_assault.png';
        notifyListeners();
        break;
      case 'Breaking and Entering':
        _selecIconCrime = 'media/breaking_and_entering.png';
        notifyListeners();
        break;
      case 'Kidnapping':
        _selecIconCrime = 'media/kidnapping.png';
        notifyListeners();
        break;
      case 'Arson':
        _selecIconCrime = 'media/arson.png';
        notifyListeners();
        break;
      case 'Property Crime':
        _selecIconCrime = 'media/property_crime.png';
        notifyListeners();
        break;
      case 'Weapon discharge':
        _selecIconCrime = 'media/weapon_discharge.png';
        notifyListeners();
        break;
      case 'DUI':
        _selecIconCrime = 'media/dui.png';
        notifyListeners();
        break;
      default:
        _selecIconCrime = 'media/crime-investigation.png';
        notifyListeners();
    }
    print(_selecIconCrime);
    notifyListeners();
  }

  printUI(String toPrint) {
    print(toPrint);
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

  String validateImmButtons() {
    String result = 'Please select all fields';
    if (whoInDangValue.contains('Myself') ||
        whoInDangValue.contains('Someone Else')) {
      if (affectedIndValue.contains('One Person') ||
          affectedIndValue.contains('Multiple individuals')) {
        if (assistanceNeedValue.contains('Medical') ||
            assistanceNeedValue.contains('Security') ||
            assistanceNeedValue.contains('Fire Department')) {
          if (incidentStatValue.contains('Ongoing') ||
              incidentStatValue.contains('Not Active')) {
            if (selectedImmValue.isNotEmpty) {
              if (selectedCrimeValue.isNotEmpty) {
                result = 'valid';
              } else {
                result = 'Please select a Title.';
              }
            } else {
              result = 'Please select a Region.';
            }
          } else {
            result = 'Please select the status of the incident.';
          }
        } else {
          result = 'Please select the type of assistance required.';
        }
      } else {
        result = 'Please select how many individuals are affected.';
      }
    } else {
      result = 'Please select who is in danger.';
    }

    return result;
  }

  String titleIconConvertRepo = 'FINIT media/crime-investigation.png';
  String setIconFromTitleImminent() {
    String path = 'PATH media/crime-investigation.png';

    // if (selectedCrimeValue.contains('Assault')) {
    //   titleIconConvertRepo = 'media/assault.png';
    // }
    // if (selectedCrimeValue.contains('Aggravating circumstances')) {
    //   titleIconConvertRepo = 'media/aggravated_assault.png';
    // }
    // if (selectedCrimeValue.contains('Breaking and Entering')) {
    //   titleIconConvertRepo = 'media/breaking_and_entering.png';
    // }
    // if (selectedCrimeValue.contains('Kidnapping')) {
    //   titleIconConvertRepo = 'media/kidnapping.png';
    // }
    // if (selectedCrimeValue.contains('Arson')) {
    //   titleIconConvertRepo = 'media/arson.png';
    // }
    // if (selectedCrimeValue.contains('Property Crime')) {
    //   titleIconConvertRepo = 'media/property_crime.png';
    // }
    // if (selectedCrimeValue.contains('Weapon discharge')) {
    //   titleIconConvertRepo = 'media/weapon_discharge.png';
    // }
    // if (selectedCrimeValue.contains('DUI')) {
    //   titleIconConvertRepo = 'media/dui.png';
    // }

    switch (selectedCrimeValue) {
      case "Assault":
        titleIconConvertRepo = 'media/assault.png';
        break;
      case "Aggravating circumstances":
        titleIconConvertRepo = 'media/assault.png';
        break;
      case "Breaking and Entering":
        titleIconConvertRepo = 'media/breaking_and_entering.png';
        break;
      case "Kidnapping":
        titleIconConvertRepo = 'media/kidnapping.png';
        break;
      case "Arson":
        titleIconConvertRepo = 'media/arson.png';
        break;
      case "Property Crime":
        titleIconConvertRepo = 'media/property_crime.png';
        break;
      case "Weapon discharge":
        titleIconConvertRepo = 'media/weapon_discharge.png';
        break;
      case "DUI":
        titleIconConvertRepo = 'media/dui.png';
        break;
      default:
        titleIconConvertRepo = 'DEFAULTmedia/crime-investigation.png';
    }
    return titleIconConvertRepo;
  }

  void clearValuesImm() {
    selectedImmValue = '';
    selectedCrimeValue = '';
    whoInDangValue = '';
    affectedIndValue = '';
    assistanceNeedValue = '';
    incidentStatValue = '';
    titleIconConvertRepo = 'media/crime-investigation.png';
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
      required String id,
      required String title,
      required String description,
      required DateTime dateTime,
      required String locationString,
      required List<String> mediaString,
      required String regionString,
      required bool isImminent}) async {
    if (!isImminent) {
      if (nonImReportFormKey.currentState?.validate() ?? false) {
        Location locationData = Location(locationString);
        List<String> media = mediaString;
        Region region = Region(name: regionString);
        Report report = Report(
            id: id,
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
    } else if (isImminent) {
      String convertedIconMedia = setIconFromTitleImminent();
      Location locationData = Location(locationString);
      List<String> media = mediaString;
      Region region = Region(name: regionString);
      Report report = Report(
          id: id,
          userName: username,
          title: title,
          description: description,
          dateTime: dateTime,
          isAlerted: false,
          isAcknowledged: false,
          locationData: locationData,
          media: [media[0], convertedIconMedia],
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
    return _reportsService.getUserReports(limit, userId);
  }

  Future<String> uploadFile(File image, String timeStamp) async {
    String imageUrl = "";
    timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = _reportsService.uploadFile(image, timeStamp);
    try {
      setState(ViewState.Busy);
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(ViewState.Success);
    } on FirebaseException catch (e) {
      setErrorDialog(NighWatchException(title: e.code, message: e.message!));
      setState(ViewState.Error);
    }
    return imageUrl;
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
