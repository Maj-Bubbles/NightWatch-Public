import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nightwatch/miscellaneous/constants.dart' as constants;
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/reports_view_model.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../miscellaneous/configuration.dart' as configuration;
import 'package:nightwatch/miscellaneous/validators.dart';

import '../../models/view_state.dart';
import '../../routes/route_manager.dart';

class NonImminentReeportUser extends StatefulWidget {
  const NonImminentReeportUser({super.key});

  @override
  State<NonImminentReeportUser> createState() => _NonImminentReeportUserState();
}

class _NonImminentReeportUserState extends State<NonImminentReeportUser> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;
  String? dropdownValue;
  String? dropdownValueTwo;

  bool? changed;
  Color onChange = constants.orangePeelForIconsAndButtons;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Scaffold(
      backgroundColor: constants.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Non-Imminent Report',
          style: TextStyle(
            color: constants.appBarTitle,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: context.read<ReportsViewModel>().nonImReportFormKey,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    splashRadius: 150,
                    highlightColor: constants.redButtonColor,
                    onPressed: () {},
                    icon: const Center(
                      child: Icon(
                        Icons.image,
                        color: constants.orangePeelForIconsAndButtons,
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
                        color: constants.silverSandForFormsAndOtherStuff,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
                      color: constants.silverSandForFormsAndOtherStuff,
                      height: 63,
                      child: Center(
                        child: TextFormField(
                          validator: validateRequired,
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          cursorColor: constants.scaffoldBackgroundColor,
                          decoration: constants.formDecoration('Crime Title'),
                        ),
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
                      color: constants.silverSandForFormsAndOtherStuff,
                      height: 150,
                      child: Center(
                        child: TextFormField(
                          validator: validateRequired,
                          controller: locationController,
                          keyboardType: TextInputType.text,
                          cursorColor: constants.scaffoldBackgroundColor,
                          decoration:
                              constants.formDecoration('Crime Description'),
                        ),
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
                    child: Center(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        validator: validateRequired,
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.white,
                        decoration: configuration.formDecorationUnder(
                          'Location of Crime',
                          const Icon(
                            Icons.location_on,
                            color: constants.orangePeelForIconsAndButtons,
                          ),
                        ),
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
                      color: constants.silverSandForFormsAndOtherStuff,
                      height: 63,
                      child: Consumer<ReportsViewModel>(
                        builder: (context, viewModel, child) {
                          return RegionDropdownSignUp(
                            items: viewModel.items,
                            text: 'Region',
                            iconData: Icons.map_outlined,
                            onChanged: (value) {
                              viewModel.selectedValue = value ?? '';
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                      top: 26.0,
                      bottom: 8.0,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text:
                            'By submitting this Report, you are accepting our ',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(
                                    RouteManager.termsAndConditionsPage);
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text:
                            'The current date and time will be added to this report.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 100.0,
                      right: 100.0,
                      top: 12.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: constants.tropicalForContainerAndButtonColor,
                          textColor: Colors.white,
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            String currentUsername = context
                                .read<UserViewModel>()
                                .currentUser
                                .userName;
                            String currentRegionString =
                                context.read<ReportsViewModel>().selectedValue;
                            context.read<ReportsViewModel>().postReportHelper(
                                username: currentUsername,
                                title: titleController.text.trim(),
                                description: descriptionController.text.trim(),
                                dateTime: DateTime.now(),
                                locationString: locationController.text.trim(),
                                mediaString: '',
                                //TODO: Integrate media selection
                                regionString: currentRegionString,
                                isImminent: false);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: constants.redButtonColor,
                          textColor: Colors.white,
                          child: const Text(
                            'Report',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Consumer<ReportsViewModel>(
                builder: (context, viewModel, _) {
                  switch (viewModel.state) {
                    case ViewState.Idle:
                      return Container();
                    case ViewState.Busy:
                      return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.6),
                          child: Center(
                            child: SizedBox(
                              height: 100,
                              width: 300,
                              child: Card(
                                color: constants.scaffoldBackgroundColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(),
                                    SizedBox(width: 20),
                                    Text(
                                      'Logging your report. Please wait.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    case ViewState.Success:
                      viewModel.setViewStateToIdle();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        navigatorService.goBack();
                        navigatorService.goBack();
                        navigatorService.showSnackBar(StatusDialog(
                            title: 'Successfully created report.',
                            message:
                                'Your non-imminent report has been created.'));
                      });
                      return Container();
                    case ViewState.Error:
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        navigatorService.showSnackBar(viewModel.errorDialog);
                        viewModel.setState(ViewState.Idle);
                      });
                      return Container();
                    default:
                      return const Text("Something Should Have happened");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegionDropdownSignUp extends StatelessWidget {
  const RegionDropdownSignUp(
      {Key? key,
      required this.items,
      required this.text,
      required this.iconData,
      required this.onChanged})
      : super(key: key);

  final List<DropdownMenuItem<String>>? items;
  final String text;
  final IconData iconData;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      validator: validateRegion,
      style: const TextStyle(color: constants.scaffoldBackgroundColor),
      dropdownColor: Colors.grey,
      icon: const Icon(Icons.map_outlined),
      iconEnabledColor: constants.scaffoldBackgroundColor,
      decoration: constants.formDecoration('Region'),
    );
  }
}
