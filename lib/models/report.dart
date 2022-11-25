import 'models.dart';

/// This class models input data from the User about
/// an incident. Its also a token of transacting with
/// Database. Thus, encapsulation is without use case.
class Report {
  final String id;
  final String userName;
  final String title;
  final String description;
  final DateTime dateTime;
  final bool isAlerted;
  final bool isAcknowledged;
  final bool isImminent;
  final List<String> media;
  final Region region;
  final Location locationData;

  Report(
      {required this.id,
      required this.userName,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.isAlerted,
      required this.isAcknowledged,
      required this.locationData,
      required this.media,
      required this.region,
      required this.isImminent});

  factory Report.fromJson(Map<dynamic, dynamic> json) {
    return Report(
        id: json['objectId'].toString() ?? "",
        userName: json['Username'].toString() ?? "",
        title: json['Title'].toString() ?? "",
        description: json['Description'].toString() ?? "",
        dateTime: json['DateTime'],
        isAlerted: json['Alerted'] as bool,
        isAcknowledged: json['Acknowledged'] as bool,
        isImminent: json['Imminent'] != null ? json['Imminent'] as bool : false,
        locationData: Location(json['LocationData'].toString() ?? "NotProvided"),
        media: List<String>.from(json['media'] ?? ['NotProvided']),
        region: Region(name: json['Region'].toString() ?? ""));
  }

  Map<String, dynamic> toJson() {
    return {
      "Username": userName,
      "Title": title,
      "Description": description,
      "DateTime": dateTime,
      "Alerted": isAlerted,
      "Acknowledged": isAcknowledged,
      "Imminent": isImminent,
      "LocationData": locationData,
      "Region": region.name,
      "Media": media,
    };
  }
}
