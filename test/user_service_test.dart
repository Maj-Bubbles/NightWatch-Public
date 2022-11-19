import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nightwatch/models/admin_user.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/repositories/apis/backendless_apis.dart';
import 'package:nightwatch/services/services.dart';
import 'package:nightwatch/view_models/error_handling.dart';

class MockUserServiceAPI extends Mock implements BackendlessUserApi {}

void main() {
  late UserService userService;
  late MockUserServiceAPI mockApi;
  final adminUser = AdminUser(
      tellNum: "0180133",
      adminCellNum: "32424234",
      name: "Admin User",
      userName: "Admin",
      isAdmin: true,
      emailAdd: "admin@nightwatch.co.za",
      region: Region(name: "Doorn"),
      password: "12345",
      primaryNumber: "098234242",
      secondaryNumber: "2343243242");
  final publicUser = PublicUser(
      cellNum: "234234234",
      emergencyNum: "234324324",
      name: "2343242424",
      userName: "Civilian",
      isAdmin: false,
      emailAdd: "normalUser@nightwatch.co.za",
      password: "54321",
      region: Region(name: "Sandania"),
      primaryNumber: "534534535",
      secondaryNumber: "53453535");

  setUp(() {
    registerFallbackValue(BackendlessUser());
    mockApi = MockUserServiceAPI();
    userService = UserService(mockApi);
  });

  test("UserService instantiated without errors", () {
    // Assert
    expect(userService, isInstanceOf<UserService>());
  });

  group("CheckIfUserExists", () {
    test("User exists Case", () async {
      // Arrange

      String email = "kamva9697@gmail.com";

      // Act
      when(() => mockApi.findUser(email)).thenAnswer((_) {
        return Future.value([BackendlessUser()]);
      });
      verifyNever(() => mockApi.findUser(email));

      var result = await userService.checkIfUserExists(email: email);

      // Assert
      expect(result, true);
    });

    test("User non-existent Case", () async {
      // Arrange
      String email = "kamva9697@gmail.com";

      // Act
      when(() => mockApi.findUser(email)).thenAnswer((_) {
        return Future.value(null);
      });
      verifyNever(() => mockApi.findUser(email));

      var result = await userService.checkIfUserExists(email: email);

      // Assert
      expect(result, false);
    });

    test("API Error Case", () async {
      // Arrange
      String email = "kamva9697@gmail.com";

      // Act
      when(() => mockApi.findUser(email)).thenThrow(UserAPIException(
          title: "Verification pending",
          message: "Please verify your email address before logging in."));

      verifyNever(() => mockApi.findUser(email));

      // Assert
      await expectLater(userService.checkIfUserExists(email: email),
          throwsA(isA<UserAPIException>()));
    });
  });

  group("CheckIfUserIsAdmin", () {
    test("User is Admin Case", () async {
      //Arrange
      var user = BackendlessUser();

      // property values are dynamic
      // thus should be cast to correct types.
      user.setProperty("Admin", true as dynamic);

      printOnFailure("user variable state: $user");

      // Act
      when(() => mockApi.getCurrentUser()).thenAnswer((_) async {
        return Future.value(user);
      });

      // Assert
      expect(await userService.checkIfUserIsAdmin(), true);
    });

    test("User not Admin Case", () async {
      //Arrange
      var user = BackendlessUser();

      // property values are dynamic
      // thus should be cast to correct types.
      user.setProperty("Admin", false as dynamic);

      printOnFailure("user variable state: $user");

      // Act
      when(() => mockApi.getCurrentUser()).thenAnswer((_) async {
        return Future.value(user);
      });

      // Assert
      expect(await userService.checkIfUserIsAdmin(), false);
    });

    test("Exception Case", () async {
      //Act
      when(() => mockApi.getCurrentUser()).thenThrow(
        UserAPIException(
            title: "Unknown email address",
            message: "No account is registered under this email address."),
      );

      //Assert
      await expectLater(userService.checkIfUserIsAdmin(), throwsA(isA<UserAPIException>()));
    });
  });

  group("CheckIfUserIsLogged", () {
    test("User is logged Case", () async {
      //Arrange

      //Act
      when(() => mockApi.isValidLogin()).thenAnswer((_) async {
        return Future.value(true);
      });

      // Assert
      expect(await userService.checkIfUserLogged(), true);
    });

    test("User is logged Case", () async {
      //Arrange

      //Act
      when(() => mockApi.isValidLogin()).thenAnswer((_) async {
        return Future.value(false);
      });

      // Assert
      expect(await userService.checkIfUserLogged(), false);
    });

    test("User is logged Case", () async {
      //Arrange

      //Act
      when(() => mockApi.isValidLogin()).thenThrow(
          UserAPIException(
          title: "",
          message: "",
        ));

      // Assert
      await expectLater(userService.checkIfUserLogged(),
          throwsA(isA<UserAPIException>()));
    });
  });

  group("ResetPassword", () {
    test("Reset Success", () async {
      // Arrange
      String email = "admin@nightwatch.co.za";
      // Act
      when(() => mockApi.resetPassword(email)).thenAnswer((invocation) {
        return Future.value();
      });

      //Assert
      expect(await userService.resetPassword(email: email), true);
    });

    test("Reset fail - Exception Case", () async {
      // Arrange
      String email = "admin@nightwatch.co.za";
      // Act
      when(() => mockApi.resetPassword(email)).thenThrow(UserAPIException(
          title: "Unknown email address",
          message: "No account is registered under this email address."));

      //Assert
      await expectLater(userService.resetPassword(email: email),
          throwsA(isA<UserAPIException>()));
    });
  });

  group("Logout", () {
    test("Logout Success", () async {
      // Arrange

      // Act
      when(() => mockApi.logout()).thenAnswer((_) {
        return Future.value();
      });

      //Assert
      expect(await userService.logoutUser(), true);
    });

    test("Reset fail - Exception Case", () async {
      // Arrange

      // Act
      when(() => mockApi.logout())
          .thenThrow(UserAPIException(title: "", message: ""));

      //Assert
      await expectLater(userService.logoutUser(), throwsA(isA<UserAPIException>()));
    });
  });

  group("SignInUser", () {
    test("Sign In Success", () async {
      // Arrange
      String email = "james.bond@mi6.co.uk";
      String password = "12345";

      // Act
      when(() => mockApi.login(email: email, password: password))
          .thenAnswer((_) {
        return Future.value(BackendlessUser());
      });

      // Assert
      expect(await userService.signInUser(email: email, password: password),
          isA<BackendlessUser>());
    });

    test("Sign In Failure", () async {
      // Arrange
      String email = "james.bond@mi6.co.uk";
      String password = "12345";

      // Act
      when(() => mockApi.login(
          email: email,
          password:
              password)).thenThrow(UserAPIException(
          title: "Invalid login or password",
          message:
              "The address and password you entered don't form a valid login."));

      // Assert
      await expectLater(userService.signInUser(email: email, password: password),
          throwsA(isA<UserAPIException>()));
    });
  });

  group("Register", () {
    test("Register User success Case", () async {
      // Arrange

      // Act
      when(() => mockApi.register(any(that: isA<BackendlessUser>())))
          .thenAnswer((_) {
        return Future.value(BackendlessUser());
      });

      // verify
      expect(
          await userService.registerUser(publicUser), isA<BackendlessUser>());
    });

    test("Register User Failure Case", () async {
      //Arrange

      // Act
      when(() => mockApi.register(any(that: isA<BackendlessUser>())))
          .thenThrow(UserAPIException(
              title: "User exists",
              message: "There is already an account for this email address."));

      // Verify
      await expectLater(userService.registerUser(adminUser), throwsA(isA<UserAPIException>()));
    });
  });

  tearDown(() {
    resetMocktailState();
  });
}
