import 'package:nightwatch/miscellaneous/configuration.dart';

import '../../models/models.dart';

class TestData {
  Report testReport1 = Report(
      id: '23B4B549-90D5-49DB-B1F6-E995157B2F42',
      userName: 'TestUser3',
      title: 'Robbery Tip',
      description:
          'Suspect similiar to markups spotted near Absa bank. Seen driving a 1997 Toyota...',
      dateTime: DateTime.now(),
      isAlerted: false,
      isAcknowledged: true,
      locationData: Location('8010 Constantia Street'),
      media: [ImageLibrary.assault],
      // media: [
      //   'https://st2.depositphotos.com/2101611/6966/v/450/depositphotos_69669865-stock-illustration-mugshot-of-anonymous-male-silhouette.jpg'
      // ],
      // media: ['media/Splash_GitHub_Page.png'],
      region: Region(name: 'Welkom'),
      isImminent: false);
  Report testReport2 = Report(
      id: '23B5B549-91D5-49DB-B1F4-E487394B2F42',
      userName: 'TestUser5',
      title: 'Stolen item',
      description: 'Alone\nNo one injured\nSecurity assistance needed\nOngoing',
      dateTime: DateTime.now(),
      isAlerted: false,
      isAcknowledged: false,
      locationData: Location('84 Jan Hofmeyer Road'),
      media: [ImageLibrary.propertyCrime],
      // media: [
      //   'https://t3.ftcdn.net/jpg/04/79/14/04/360_F_479140492_IoZVw8cX4ujiQP2ik2hdelZ1nwORkBlF.jpg'
      // ],
      // media: ['media/Splash_GitHub_Page.png'],
      region: Region(name: 'Welkom'),
      isImminent: true);
}
