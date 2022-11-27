import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:provider/provider.dart';

class ImminentReportUser extends StatefulWidget {
  const ImminentReportUser({super.key});

  @override
  State<ImminentReportUser> createState() => _ImminentReportUserState();
}

class _ImminentReportUserState extends State<ImminentReportUser> {
  //controller
  List<String> imminentReportDetails =
      []; //You can change to map List<Map<String, String>>
  //Who is in danger?
  String mySelf = '';
  bool addedOne = false;

  String mySelfAdded = 'Already Added, move on';

  String someoneElse = '';
  bool addedTwo = false;

  String someoneElseAdded = 'Already Added, move on';

  //How many individuals are affected?
  String onePerson = '';
  bool addedThree = false;

  String onePersonAdded = 'Already Added, move on';

  String multiplePersons = '';
  bool addedFour = false;

  String multiplePersonsAdded = 'Already Added, move on';

  //What type of assistance will be needed?
  String medicalAssistance = '';
  bool addedFive = false;

  String medicalAssistanceAdded = 'Already Added, move on';

  String securityOrSaps = '';
  bool addedSix = false;

  String securityOrSapsAdded = 'Already Added, move on';

  String fireDepartment = '';
  bool addedSeven = false;

  String fireDepartmentAdded = 'Already Added, move on';

  //What is the status of the incident?
  String onGoing = '';
  bool addedEight = false;

  String onGoingAdded = 'Already Added, move on';

  String notActive = '';
  bool addedNine = false;

  String notActiveAdded = 'Already Added, move on';

  late TextEditingController regionController;
  late TextEditingController crimeController;

  List<String> regions = <String>['Thabong', 'Welkom'];
  List<String> crimes = <String>['Robbery', 'Rape'];
  String? dropdownValue;
  String? dropdownValueTwo;

  bool? changed;
  Color onChange = orangePeelForIconsAndButtons;

  @override
  void initState() {
    super.initState();
    regionController = TextEditingController();
    crimeController = TextEditingController();
  }

  @override
  void dispose() {
    regionController.dispose();
    crimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Imminent Report',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
/////////////////////////////////////////////////////////////////
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              top: 15.0,
              bottom: 3.0,
            ),
            child: Center(
              //added a card /shape/side color
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: orangePeelForIconsAndButtons,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(9.0),
                      //added font from 16 to 19/
                      child: Text(
                        'Select Region',
                        style: TextStyle(
                          color: orangePeelForIconsAndButtons,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: dropdownValue,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Icon(Icons.arrow_downward),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                        color: redButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          regionController.text = value;
                        });
                        print(regionController.text);
                      },
                      items:
                          regions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),

/////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.only(
              left: 14.0,
              right: 14.0,
              top: 5.0,
              bottom: 3.0,
            ),
            child: Center(
              //added a card/shape/side

              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: orangePeelForIconsAndButtons,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        'Select Crime',
                        style: TextStyle(
                          color: orangePeelForIconsAndButtons,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: dropdownValueTwo,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Icon(Icons.arrow_downward),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                        color: redButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValueTwo = value!;
                          crimeController.text = value;
                        });
                        print(crimeController.text);
                      },
                      items:
                          crimes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
/////////////////////////////////////////////////////////////////
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 20,
            ),
            child: Text(
              'Who is in danger?',
              style: TextStyle(
                color: appBarTitle,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
/////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              //height from 80 to 60
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  //from 20 to 40
                  Radius.circular(40),
                ),
              ),

              elevation: 5,
              onPressed: () {
                setState(() {
                  mySelf = 'Myself';
                  if (imminentReportDetails.contains(mySelf)) {
                    addedOne = true;
                  } else {
                    imminentReportDetails.add(mySelf);
                  }

                  print(imminentReportDetails);
                });
              },
              //added card
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Myself',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  mySelf.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedOne
              ? Center(
                  child: Text(
                    mySelfAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
/////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  someoneElse = 'Someone Else';
                  if (imminentReportDetails.contains(someoneElse)) {
                    addedTwo = true;
                  } else {
                    imminentReportDetails.add(someoneElse);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Someone Else',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  someoneElse.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedTwo
              ? Center(
                  child: Text(
                    someoneElseAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 20,
            ),
            child: Center(
              child: Text(
                'How many individuals are affected?',
                style: TextStyle(
                  color: appBarTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  onePerson = 'One person';
                  if (imminentReportDetails.contains(onePerson)) {
                    addedThree = true;
                  } else {
                    imminentReportDetails.add(onePerson);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'One Person',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  onePerson.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedThree
              ? Center(
                  child: Text(
                    onePersonAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  multiplePersons = 'Multiple Persons';
                  if (imminentReportDetails.contains(multiplePersons)) {
                    addedFour = true;
                  } else {
                    imminentReportDetails.add(multiplePersons);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Multiple Persons',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  multiplePersons.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedFour
              ? Center(
                  child: Text(
                    multiplePersonsAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 20,
            ),
            child: Center(
              child: Text(
                'What type of assistance will be needed?',
                style: TextStyle(
                  color: appBarTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  medicalAssistance = 'Medical Assistance';
                  if (imminentReportDetails.contains(medicalAssistance)) {
                    addedFive = true;
                  } else {
                    imminentReportDetails.add(medicalAssistance);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Medical Assistance',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  medicalAssistance.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedFive
              ? Center(
                  child: Text(
                    medicalAssistanceAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  securityOrSaps = 'Security Or Saps';
                  if (imminentReportDetails.contains(securityOrSaps)) {
                    addedSix = true;
                  } else {
                    imminentReportDetails.add(securityOrSaps);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Security Or Saps',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  securityOrSaps.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedSix
              ? Center(
                  child: Text(
                    securityOrSapsAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  fireDepartment = 'Fire Department';
                  if (imminentReportDetails.contains(fireDepartment)) {
                    addedSeven = true;
                  } else {
                    imminentReportDetails.add(fireDepartment);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Fire Department',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  fireDepartment.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedSeven
              ? Center(
                  child: Text(
                    fireDepartmentAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
              top: 20,
            ),
            child: Center(
              child: Text(
                'What is the status of the incident?',
                style: TextStyle(
                  color: appBarTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  onGoing = 'Ongoing';
                  if (imminentReportDetails.contains(onGoing)) {
                    addedEight = true;
                  } else {
                    imminentReportDetails.add(onGoing);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ongoing',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  onGoing.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedEight
              ? Center(
                  child: Text(
                    medicalAssistanceAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: MaterialButton(
              height: 60,
              color: onChange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              elevation: 5,
              onPressed: () {
                setState(() {
                  notActive = 'Not Active';
                  if (imminentReportDetails.contains(notActive)) {
                    addedNine = true;
                  } else {
                    imminentReportDetails.add(notActive);
                  }

                  print(imminentReportDetails);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not Active',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  notActive.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.check_circle_sharp,
                          color: redButtonColor,
                        ),
                ],
              ),
            ),
          ),
          addedNine
              ? Center(
                  child: Text(
                    medicalAssistanceAdded,
                    style: const TextStyle(
                      color: appBarTitle,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 30,
            ),
            child: MaterialButton(
              height: 40,
              color: redButtonColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 5,
              onPressed: () {
                navigatorService.showSnackBar(StatusDialog(
                    message: 'The report has been filed successfully.'
                        'Please wait for the security or SAPS to help.',
                    title: 'Imminent Report'));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 140,
          )
        ],
      ),
    );
  }
}
