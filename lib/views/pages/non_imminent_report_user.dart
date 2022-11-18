import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';

class NonImminentReeportUser extends StatefulWidget {
  const NonImminentReeportUser({super.key});

  @override
  State<NonImminentReeportUser> createState() => _NonImminentReeportUserState();
}

class _NonImminentReeportUserState extends State<NonImminentReeportUser> {
  late TextEditingController regionController;
  late TextEditingController crimeController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;

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
    descriptionController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void dispose() {
    regionController.dispose();
    crimeController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Non Imminent Report',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          IconButton(
            splashRadius: 150,
            highlightColor: redButtonColor,
            onPressed: () {},
            icon: const Center(
              child: Icon(
                Icons.image,
                color: orangePeelForIconsAndButtons,
                size: 70,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Add Photos of Incident',
              style: TextStyle(
                color: silverSandForFormsAndOtherStuff,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 18,
              bottom: 3.0,
            ),
            child: Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Center(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        'Crime Category',
                        style: TextStyle(
                          color: scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 5.0,
              bottom: 3.0,
            ),
            child: Container(
              color: silverSandForFormsAndOtherStuff,
              height: 200,
              child: Center(
                child: TextFormField(
                  minLines: 1000,
                  validator: validateEmptyMessage,
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: scaffoldBackgroundColor,
                  decoration: formDecoration('Description'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 5.0,
              bottom: 3.0,
            ),
            child: Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Center(
                child: TextFormField(
                  validator: validateEmptyMessage,
                  controller: locationController,
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: scaffoldBackgroundColor,
                  decoration: formDecoration('Location of Crime'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 18,
              bottom: 3.0,
            ),
            child: Container(
              color: silverSandForFormsAndOtherStuff,
              height: 63,
              child: Center(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Text(
                        'Select Region',
                        style: TextStyle(
                          color: scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
        ],
      ),
    );
  }
}
