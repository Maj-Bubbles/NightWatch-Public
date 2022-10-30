import 'package:backendless_sdk/backendless_sdk.dart';

class InitApp {
  static const String apiKeyAndroid =
      'E749BB17-9624-4463-A085-72FA74F4453F'; //Android Api Key
  static const String apiKeyIOS =
      'C4BAA60D-3CDC-4319-AC9C-CBD2C506C6F5'; //iOS Api Key
  static const String appID =
      '991667C2-4F37-9C61-FF34-ADD80E54ED00'; //AppID Api Key

  static void initializeApp() async {
    await Backendless.initApp(
        androidApiKey: apiKeyAndroid,
        iosApiKey: apiKeyIOS,
        applicationId: appID);
  }
}
