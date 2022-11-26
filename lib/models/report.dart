import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Report.fromDocument(DocumentSnapshot doc) {
    return Report(
      id: doc.exists ? doc.get("objectId") : "NonExistent",
      userName: doc.exists ? doc.get("Username") : "NonExistent",
      title: doc.exists ? doc.get("Title") : "NonExistent",
      description: doc.exists ? doc.get("Description") : "NonExistent",
      dateTime: DateTime.now(),
      isAlerted: doc.exists ? doc.get("Alerted") as bool : false,
      isAcknowledged: doc.exists ? doc.get("Acknowledged") as bool : false,
      isImminent: doc.exists ? doc.get("Imminent") as bool : false,
      locationData: doc.exists ? Location(doc.get("LocationData")) : Location("NonExistent"),
      region: doc.exists ? Region(name: doc.get("Region")) : Region(name: "NonExistent"),
      media: doc.exists ? List.from(doc.get("Media")): <String>[""],
    );
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
