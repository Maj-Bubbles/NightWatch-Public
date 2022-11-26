import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';
import 'package:nightwatch/models/view_state.dart';
import 'package:nightwatch/routes/route_manager.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/error_handling.dart';
import 'package:nightwatch/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(14.0),
          child: ListView(
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  color: appBarTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                color: Colors.blueGrey[200],
                margin: const EdgeInsets.all(8.0),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    ProfileCard(
                        title: "Username",
                        subtitle:
                            context.read<UserViewModel>().currentUser.userName,
                        onTap: () {
                          navigatorService
                              .navigateTo(RouteManager.userEditNamePage);
                        }),
                    ProfileCard(
                        title: context.read<UserViewModel>().currentUser.isAdmin
                            ? "Company Name"
                            : "Full Names",
                        subtitle:
                            context.read<UserViewModel>().currentUser.name,
                        onTap: () {
                          navigatorService
                              .navigateTo(RouteManager.userEditNamePage);
                        }),
                    ProfileCard(
                        title: context.read<UserViewModel>().currentUser.isAdmin
                            ? "Company Telephone"
                            : "Cellphone Number",
                        subtitle: context
                            .read<UserViewModel>()
                            .currentUser
                            .primaryNumber,
                        onTap: () {
                          navigatorService
                              .navigateTo(RouteManager.userEditCellNumberPage);
                        }),
                    ProfileCard(
                        title: context.read<UserViewModel>().currentUser.isAdmin
                            ? "Admin Cellphone"
                            : "Emergency Number",
                        subtitle: context
                            .read<UserViewModel>()
                            .currentUser
                            .secondaryNumber,
                        onTap: () {
                          navigatorService.navigateTo(
                              RouteManager.userEditEmergencyNumberPage);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5.0, bottom: 5.0, top: 17.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  onTap: () {
                    navigatorService.navigateTo(RouteManager.repotsByUserPage);
                  },
                  title: const Text(
                    'My Reports',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  tileColor: orangePeelForIconsAndButtons,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(
                color: orangePeelForIconsAndButtons,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    color: appBarTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: orangePeelForIconsAndButtons,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(
                        color: orangePeelForIconsAndButtons,
                      )),
                  leading: const Icon(
                    Icons.notifications,
                    color: orangePeelForIconsAndButtons,
                  ),
                  onTap: () {},
                  title: const Text(
                    'Notifications',
                    style: TextStyle(
                      color: orangePeelForIconsAndButtons,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tileColor: Colors.black,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: orangePeelForIconsAndButtons,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(
                        color: orangePeelForIconsAndButtons,
                      )),
                  leading: const Icon(
                    Icons.policy,
                    color: orangePeelForIconsAndButtons,
                  ),
                  onTap: () {
                    navigatorService
                        .navigateTo(RouteManager.termsAndConditionsPage);
                  },
                  title: const Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      color: orangePeelForIconsAndButtons,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tileColor: Colors.black,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: orangePeelForIconsAndButtons,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(
                        color: orangePeelForIconsAndButtons,
                      )),
                  leading: const Icon(
                    Icons.language,
                    color: orangePeelForIconsAndButtons,
                  ),
                  onTap: () {},
                  title: const Text(
                    'Language Options',
                    style: TextStyle(
                      color: orangePeelForIconsAndButtons,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tileColor: Colors.black,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: orangePeelForIconsAndButtons,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(
                        color: orangePeelForIconsAndButtons,
                      )),
                  leading: const Icon(
                    Icons.logout,
                    color: orangePeelForIconsAndButtons,
                  ),
                  onTap: () {
                    context.read<UserViewModel>().logoutUser();
                  },
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: orangePeelForIconsAndButtons,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  tileColor: Colors.black,
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: orangePeelForIconsAndButtons,
                  ),
                ),
              ),
            ],
          ),
        ),
        Consumer<UserViewModel>(
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
                          color: scaffoldBackgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(width: 20),
                              Text(
                                'Signing you out. Please wait',
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
                  navigatorService.showSnackBar(StatusDialog(
                      title: 'Logged Out Successfully.',
                      message: 'Your account was logged out successfully.'));
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
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;
  const ProfileCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      elevation: 16,
      shadowColor: Colors.black,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: GestureDetector(
          child: const Text('Edit'),
          onTap: onTap,
        ),
      ),
    );
  }
}
