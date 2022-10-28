import 'package:uuid/uuid.dart';
import 'models.dart';

abstract class Report {
  String _id = "";
  String _title = "";
  String _description = "";
  late DateTime _dateTime;
  bool _isAlerted = false;
  bool _isAcknowledged = false;
  late Media _media;
  late Region _region;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  DateTime get dateTime => _dateTime;
  bool get isAlerted => _isAlerted;
  bool get isAcknowledged => _isAcknowledged;
  Media get media => _media;
  Region get region => _region;

  set id(String value) {
    _id = value;
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
  set isAcknowledged(bool value) {
    _isAcknowledged = value;
  }
  set media(Media value) {
    _media = value;
  }
  set region(Region value) {
    _region = value;
  }

  Report() {
    _media = Media(_id);
    _region = Region();
    _dateTime = DateTime.now();
  }
}

class ImminentReport extends Report {

}

class NonImminentReport extends Report {

}
