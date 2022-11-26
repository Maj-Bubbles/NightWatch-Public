import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nightwatch/miscellaneous/firebase_constants.dart';
import 'package:nightwatch/models/models.dart';

class FirebaseReportsService {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FirebaseReportsService({required this.firebaseFirestore, required this.firebaseStorage});

  UploadTask uploadFile(File image, String fileName) {
    Reference reference = firebaseStorage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Stream<QuerySnapshot> getReportsStream(int limit,
      [String textSearch = ""]) {
    if (textSearch.isNotEmpty == true) {
      return firebaseFirestore
          .collection(FirestoreConstants.pathReportsCollection)
          .limit(limit)
          .where(FirestoreConstants.objectId, isEqualTo: textSearch)
          .snapshots();
    } else {
      return firebaseFirestore
          .collection(FirestoreConstants.pathReportsCollection)
          .limit(limit)
          .snapshots();
    }
  }

  Stream<QuerySnapshot> getUserReports(int limit, String userId) {
   return getReportsStream(limit, userId);
  }

  Future<void> storeReport(Report report, String userId) {
    return firebaseFirestore
        .collection(FirestoreConstants.pathReportsCollection)
        .add({
          "objectId": userId,
          "Username": report.userName,
          "Title": report.title,
          "Description": report.description,
          "DateTime": report.dateTime,
          "Alerted": report.isAlerted,
          "Acknowledged": report.isAcknowledged,
          "Imminent": report.isImminent,
          "Media": report.media,
          "Region": report.region.name,
          "LocationData": report.locationData.location
        })
        .then((value) => print("Report Id: $userId Added to Firebase"));
  }
}
