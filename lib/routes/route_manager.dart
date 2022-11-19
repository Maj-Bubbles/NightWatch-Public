import 'package:flutter/material.dart';
import 'package:nightwatch/views/pages/sign_upBub.dart';
import 'package:nightwatch/views/pages/splash_screen.dart';
import 'package:nightwatch/views/pages/emergency_numbers.dart';
import 'package:nightwatch/views/pages/fogort_password.dart';
import 'package:nightwatch/views/pages/imminent_report_user.dart';
import 'package:nightwatch/views/pages/login_page.dart';
import 'package:nightwatch/views/pages/map.dart';
import 'package:nightwatch/views/pages/more_details_non_imm.dart';
import 'package:nightwatch/views/pages/non_imminent_report_user.dart';
import 'package:nightwatch/views/pages/onboarding.dart';
import 'package:nightwatch/views/pages/reporting_incident_user.dart';
import 'package:nightwatch/views/pages/sign_up.dart';
import 'package:nightwatch/views/pages/specific_user_reports.dart';
import 'package:nightwatch/views/pages/ts_and_cs.dart';
import 'package:nightwatch/views/pages/user_edit_cell.dart';
import 'package:nightwatch/views/pages/user_edit_emergency_contact.dart';
import 'package:nightwatch/views/pages/user_edit_name.dart';
import 'package:nightwatch/views/pages/user_news_feed.dart';
import 'package:nightwatch/views/pages/user_reports_feed.dart';

class RouteManager {
  static const String splashScreen = '/';
  static const String onBoardingPage = '/onBoardingPage';
  static const String loginPage = '/loginPage';
  static const String signUpPageSolom = '/signUpPageSolom';
  static const String signUpPageBub = '/signUpPageBub';
  static const String forgotPasswordPage = '/forgotPasswordPage';
  static const String termsAndConditionsPage = '/termsAndConditionsPage';
  static const String emergencyPage = '/emergencyPage';
  static const String userRepotsFeedPage = '/userRepotsFeedPage';
  static const String newsFeedPage = '/newsFeedPage';
  static const String repotsByUserPage = '/repotsByUserPage';
  static const String userEditNamePage = '/userEditNamePage';
  static const String userEditEmergencyNumberPage =
      '/userEditEmergencyNumberPage';
  static const String userEditCellNumberPage = '/userEditCellNumberPage';
  static const String mapPage = '/mapPage';
  static const String moreDetailsNonImmPage = '/moreDetailsNonImmPage';
  static const String userReportingPage = '/userReportingPage';
  static const String userReportImminentPage = '/userReportImminentPage';
  static const String userReportiNonImminentPage =
      '/userReportiNonImminentPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const LoadingPage(),
        );

      case onBoardingPage:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );

      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case signUpPageBub:
        return MaterialPageRoute(
          builder: (context) => const SignUpPageBub(),
        );

      case forgotPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgotPassword(),
        );

      case signUpPageSolom:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );

      case termsAndConditionsPage:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditions(),
        );

      case emergencyPage:
        return MaterialPageRoute(
          builder: (context) => const Emergency(),
        );

      case userRepotsFeedPage:
        return MaterialPageRoute(
          builder: (context) => const UserReportsFeed(),
        );

      case newsFeedPage:
        return MaterialPageRoute(
          builder: (context) => const NewsFeed(),
        );

      case repotsByUserPage:
        return MaterialPageRoute(
          builder: (context) => const ReportsByUser(),
        );

      case userEditNamePage:
        return MaterialPageRoute(
          builder: (context) => const UserEditName(),
        );

      case userEditEmergencyNumberPage:
        return MaterialPageRoute(
          builder: (context) => const UserEditEmergencyNumber(),
        );

      case userEditCellNumberPage:
        return MaterialPageRoute(
          builder: (context) => const UserEditCellNumber(),
        );

      case mapPage:
        return MaterialPageRoute(
          builder: (context) => const MapGoogleR(),
        );

      case moreDetailsNonImmPage:
        return MaterialPageRoute(
          builder: (context) => const MoreDetailsNonImm(),
        );

      case userReportingPage:
        return MaterialPageRoute(
          builder: (context) => const Reporting(),
        );

      case userReportImminentPage:
        return MaterialPageRoute(
          builder: (context) => const ImminentReportUser(),
        );

      case userReportiNonImminentPage:
        return MaterialPageRoute(
          builder: (context) => const NonImminentReeportUser(),
        );

      default:
        throw Exception('No route found!');
    }
  }
}
