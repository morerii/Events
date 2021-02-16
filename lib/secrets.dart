
import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "277775692-dmndjd1a8d9gsl0qlukdek4hgvlbladi.apps.googleusercontent.com";
  static const IOS_CLIENT_ID = "";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}