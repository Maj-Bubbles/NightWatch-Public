import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/view_models.dart';
import 'package:provider/provider.dart';

class ImminentReportUser extends StatefulWidget {
  const ImminentReportUser({super.key});

  @override
  State<ImminentReportUser> createState() => _ImminentReportUserState();
}

class _ImminentReportUserState extends State<ImminentReportUser> {
  late TextEditingController regionController;
  late TextEditingController crimeController;

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
      body: ListView(
        children: [
/*


First button cluster


 */

          const ButtonTitle(title: 'Who is in Danger?'),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: Column(
              children: [
                /*


                Button number 1


                */
                MaterialButton(
                  height: 80,
                  color: context.watch<ReportsViewModel>().whoInDangValue ==
                          'Myself'
                      ? silverSandForFormsAndOtherStuff
                      : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().whoInDangValue = 'Myself';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Myself',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                /*


                Button number 2


                */
                MaterialButton(
                  height: 80,
                  color: context.watch<ReportsViewModel>().whoInDangValue ==
                          'Someone Else'
                      ? silverSandForFormsAndOtherStuff
                      : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().whoInDangValue =
                        'Someone Else';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Someone Else',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

/*


Second Button cluster


 */
          const ButtonTitle(title: 'How many individuals are affected?'),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: Column(
              children: [
                /*


                Button number 1


                */
                MaterialButton(
                  height: 80,
                  color: context.watch<ReportsViewModel>().affectedIndValue ==
                          'One Person'
                      ? silverSandForFormsAndOtherStuff
                      : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().affectedIndValue =
                        'One Person';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'One Person',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                /*


                Button number 2


                */
                MaterialButton(
                  height: 80,
                  color: context.watch<ReportsViewModel>().affectedIndValue ==
                          'Someone Else'
                      ? silverSandForFormsAndOtherStuff
                      : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().affectedIndValue =
                        'Someone Else';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Someone Else',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

/*


Third Button cluster


 */
          const ButtonTitle(title: 'What type of assistance do you require?'),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: Column(
              children: [
                /*


                Button number 1


                */
                MaterialButton(
                  height: 80,
                  color:
                      context.watch<ReportsViewModel>().assistanceNeedValue ==
                              'Medical'
                          ? silverSandForFormsAndOtherStuff
                          : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().assistanceNeedValue =
                        'Medical';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Medical',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                /*


                Button number 2


                */
                MaterialButton(
                  height: 80,
                  color:
                      context.watch<ReportsViewModel>().assistanceNeedValue ==
                              'Security'
                          ? silverSandForFormsAndOtherStuff
                          : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().assistanceNeedValue =
                        'Security';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Security',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                /*


                Button number 3


                */
                MaterialButton(
                  height: 80,
                  color:
                      context.watch<ReportsViewModel>().assistanceNeedValue ==
                              'Fire Department'
                          ? silverSandForFormsAndOtherStuff
                          : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().assistanceNeedValue =
                        'Fire Department';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Fire Department',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
/*


Fourth button cluster


 */

          const ButtonTitle(title: 'What is the status of the incident?'),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              top: 10,
            ),
            child: Column(
              children: [
                /*


                Button number 1


                */
                MaterialButton(
                  height: 80,
                  color: context.watch<ReportsViewModel>().incidentStatValue ==
                          'Ongoing'
                      ? silverSandForFormsAndOtherStuff
                      : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().incidentStatValue =
                        'Ongoing';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Ongoing',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                /*


                Button number 2


                */
                MaterialButton(
                  height: 80,
                  color: context.watch<ReportsViewModel>().incidentStatValue ==
                          'Not Active'
                      ? silverSandForFormsAndOtherStuff
                      : orangePeelForIconsAndButtons,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  onPressed: () {
                    context.read<ReportsViewModel>().incidentStatValue =
                        'Not Active';
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Not Active',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 26.0,
              bottom: 8.0,
            ),
            child: Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Consumer<ReportsViewModel>(
                builder: (context, viewModel, child) {
                  return RegionDropdownImminent(
                    items: viewModel.itemsImminent,
                    text: 'Region',
                    iconData: const Icon(Icons.map_outlined),
                    onChanged: (value) {
                      viewModel.selectedImmValue = value ?? '';
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 26.0,
              bottom: 8.0,
            ),
            child: Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Consumer<ReportsViewModel>(
                builder: (context, viewModel, child) {
                  return RegionDropdownImminent(
                    items: viewModel.itemsCrime,
                    text: 'Type of Crime',
                    iconData: const Icon(Icons.info),
                    onChanged: (value) {
                      viewModel.selectedCrimeValue = value ?? '';
                    },
                  );
                },
              ),
            ),
          ),
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
          ),
        ],
      ),
    );
  }
}

class ButtonTitle extends StatelessWidget {
  const ButtonTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: appBarTitle,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RegionDropdownImminent extends StatelessWidget {
  const RegionDropdownImminent(
      {Key? key,
      required this.items,
      required this.text,
      required this.iconData,
      required this.onChanged})
      : super(key: key);

  final List<DropdownMenuItem<String>>? items;
  final String text;
  final Widget? iconData;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      validator: validateRegion,
      style: const TextStyle(color: scaffoldBackgroundColor),
      dropdownColor: Colors.grey,
      icon: iconData,
      iconEnabledColor: scaffoldBackgroundColor,
      decoration: formDecoration(text),
    );
  }
}



// const Padding(
//             padding: EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 20,
//             ),
//             child: Text(
//               'Who is in danger?',
//               style: TextStyle(
//                 color: appBarTitle,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   mySelf = 'Myself';
//                   if (imminentReportDetails.contains(mySelf)) {
//                     addedOne = true;
//                   } else {
//                     imminentReportDetails.add(mySelf);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Myself',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   mySelf.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedOne
//               ? Center(
//                   child: Text(
//                     mySelfAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   someoneElse = 'Someone Else';
//                   if (imminentReportDetails.contains(someoneElse)) {
//                     addedTwo = true;
//                   } else {
//                     imminentReportDetails.add(someoneElse);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Someone Else',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   someoneElse.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedTwo
//               ? Center(
//                   child: Text(
//                     someoneElseAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           const Padding(
//             padding: EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 20,
//             ),
//             child: Center(
//               child: Text(
//                 'How many individuals are affected?',
//                 style: TextStyle(
//                   color: appBarTitle,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   onePerson = 'One person';
//                   if (imminentReportDetails.contains(onePerson)) {
//                     addedThree = true;
//                   } else {
//                     imminentReportDetails.add(onePerson);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'One Person',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   onePerson.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedThree
//               ? Center(
//                   child: Text(
//                     onePersonAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   multiplePersons = 'Multiple Persons';
//                   if (imminentReportDetails.contains(multiplePersons)) {
//                     addedFour = true;
//                   } else {
//                     imminentReportDetails.add(multiplePersons);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Multiple Persons',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   multiplePersons.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedFour
//               ? Center(
//                   child: Text(
//                     multiplePersonsAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           const Padding(
//             padding: EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 20,
//             ),
//             child: Center(
//               child: Text(
//                 'What type of assistance will be needed?',
//                 style: TextStyle(
//                   color: appBarTitle,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   medicalAssistance = 'Medical Assistance';
//                   if (imminentReportDetails.contains(medicalAssistance)) {
//                     addedFive = true;
//                   } else {
//                     imminentReportDetails.add(medicalAssistance);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Medical Assistance',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   medicalAssistance.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedFive
//               ? Center(
//                   child: Text(
//                     medicalAssistanceAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   securityOrSaps = 'Security Or Saps';
//                   if (imminentReportDetails.contains(securityOrSaps)) {
//                     addedSix = true;
//                   } else {
//                     imminentReportDetails.add(securityOrSaps);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Security Or Saps',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   securityOrSaps.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedSix
//               ? Center(
//                   child: Text(
//                     securityOrSapsAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   fireDepartment = 'Fire Department';
//                   if (imminentReportDetails.contains(fireDepartment)) {
//                     addedSeven = true;
//                   } else {
//                     imminentReportDetails.add(fireDepartment);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Fire Department',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   fireDepartment.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedSeven
//               ? Center(
//                   child: Text(
//                     fireDepartmentAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           const Padding(
//             padding: EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 20,
//             ),
//             child: Center(
//               child: Text(
//                 'What is the status of the incident?',
//                 style: TextStyle(
//                   color: appBarTitle,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   onGoing = 'Ongoing';
//                   if (imminentReportDetails.contains(onGoing)) {
//                     addedEight = true;
//                   } else {
//                     imminentReportDetails.add(onGoing);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Ongoing',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   onGoing.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedEight
//               ? Center(
//                   child: Text(
//                     medicalAssistanceAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 40,
//               right: 40,
//               top: 10,
//             ),
//             child: MaterialButton(
//               height: 80,
//               color: onChange,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//               ),
//               elevation: 5,
//               onPressed: () {
//                 setState(() {
//                   notActive = 'Not Active';
//                   if (imminentReportDetails.contains(notActive)) {
//                     addedNine = true;
//                   } else {
//                     imminentReportDetails.add(notActive);
//                   }

//                   print(imminentReportDetails);
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Not Active',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   notActive.isEmpty
//                       ? Container()
//                       : const Icon(
//                           Icons.check_circle_sharp,
//                           color: redButtonColor,
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           addedNine
//               ? Center(
//                   child: Text(
//                     medicalAssistanceAdded,
//                     style: const TextStyle(
//                       color: appBarTitle,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               : Container(),