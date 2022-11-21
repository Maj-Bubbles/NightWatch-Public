import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/miscellaneous/validators.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController emailController;
  late TextEditingController namesController;
  late TextEditingController cellphoneController;
  late TextEditingController emergencyContactController;
  late TextEditingController regionController;
  late TextEditingController passwordController;


  List<String> regions = <String>['Thabong', 'Welkom'];
  String? dropdownValue;

  bool? isChecked;
  bool? isCheckedTwo;
  bool agreeToTerms = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    namesController = TextEditingController();
    cellphoneController = TextEditingController();
    emergencyContactController = TextEditingController();
    regionController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    namesController.dispose();
    cellphoneController.dispose();
    emergencyContactController.dispose();
    regionController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBoxH10(),
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
                    validator: validateEmptyName,
                    controller: namesController,
                    keyboardType: TextInputType.name,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('First and Last name'),
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
                    validator: validateNumber,
                    controller: cellphoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Cellphone Number'),
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
                    validator: validateNumber,
                    controller: emergencyContactController,
                    keyboardType: TextInputType.phone,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Emergency Contact'),
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
                        items: regions
                            .map<DropdownMenuItem<String>>((String value) {
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
                height: 63,
                child: Center(
                  child: TextFormField(
                    validator: validateEmail,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Email Address'),
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
                    validator: validatePassword,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: scaffoldBackgroundColor,
                    decoration: formDecoration('Password'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 12.0,
                bottom: 1.0,
              ),
              child: MaterialButton(
                onPressed: () {
                  navigatorService.showSnackBar(StatusDialog(message: 'Profile created Successfuly', title: 'Sign Up'));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: orangePeelForIconsAndButtons,
                textColor: Colors.white,
                child: const Text(
                  'Submit',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                navigatorService.navigateTo(RouteManager.loginPage);
              },
              child: const Text(
                'Already have an account?',
                style: TextStyle(
                  color: silverSandForFormsAndOtherStuff,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//DropDown

/**
 * import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: DropdownButtonExample(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

 */

//Checkbox

/**
 * import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

 */

//ToggleButton

/**
 * import 'package:flutter/material.dart';

const List<Widget> fruits = <Widget>[
  Text('Apple'),
  Text('Banana'),
  Text('Orange')
];

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots')
];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'ToggleButtons Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ToggleButtonsSample(title: _title),
    );
  }
}

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key, required this.title});

  final String title;

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  final List<bool> _selectedFruits = <bool>[true, false, false];
  final List<bool> _selectedVegetables = <bool>[false, true, false];
  final List<bool> _selectedWeather = <bool>[false, false, true];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ToggleButtons with a single selection.
              Text('Single-select', style: theme.textTheme.titleSmall),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.red[700],
                selectedColor: Colors.white,
                fillColor: Colors.red[200],
                color: Colors.red[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedFruits,
                children: fruits,
              ),
              const SizedBox(height: 20),
              // ToggleButtons with a multiple selection.
              Text('Multi-select', style: theme.textTheme.titleSmall),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  // All buttons are selectable.
                  setState(() {
                    _selectedVegetables[index] = !_selectedVegetables[index];
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.green[700],
                selectedColor: Colors.white,
                fillColor: Colors.green[200],
                color: Colors.green[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedVegetables,
                children: vegetables,
              ),
              const SizedBox(height: 20),
              // ToggleButtons with icons only.
              Text('Icon-only', style: theme.textTheme.titleSmall),
              const SizedBox(height: 5),
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedWeather.length; i++) {
                      _selectedWeather[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.blue[700],
                selectedColor: Colors.white,
                fillColor: Colors.blue[200],
                color: Colors.blue[400],
                isSelected: _selectedWeather,
                children: icons,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            // When the button is pressed, ToggleButtons direction is changed.
            vertical = !vertical;
          });
        },
        icon: const Icon(Icons.screen_rotation_outlined),
        label: Text(vertical ? 'Horizontal' : 'Vertical'),
      ),
    );
  }
}

 */