import 'models.dart';

abstract class Report {
  String _id = "";
  String _userName = "";
  String _title = "";
  String _description = "";
  late DateTime _dateTime;
  bool _isAlerted = false;
  bool _isAcknowledged = false;
  bool _isImminent = false;
  late List<String> _media;
  late Region _region;
  late Location _locationData;

  String get id => _id;
  String get username => _userName;
  String get title => _title;
  String get description => _description;
  DateTime get dateTime => _dateTime;
  bool get isAlerted => _isAlerted;
  bool get isAcknowledged => _isAcknowledged;
  bool get isImminent => _isImminent;
  List<String> get media => _media;
  Region get region => _region;
  Location get locationData => _locationData;

  set id(String value) {
    _id = value;
  }

  set username(String value) {
    _userName = value;
  }

  set title(String value) {
    _title = value;
  }
  set description(String value) {
    _description= value;
  }
  set dateTime(DateTime value) {
    _dateTime = value;
  }
  set isAlerted(bool value) {
    _isAlerted = value;
  }
  set isImminent(bool value) {
    _isImminent = value;
  }
  set isAcknowledged(bool value) {
    _isAcknowledged = value;
  }
  set media(List<String> value) {
    _media = value;
  }
  set region(Region value) {
    _region = value;
  }
  set locationData(Location value) {
    _locationData = value;
  }

  Report() {
    _media = [];
    _region = Region();
    _dateTime = DateTime.now();
    _locationData = Location();
  }
}

