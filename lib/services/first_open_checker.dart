import 'package:commons/commons.dart';

class FirstOpenChecker {
  Future<bool> checkForFirstOpen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('checkForFirstOpen') ?? false;
  }

  void saveFirstOpen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('checkForFirstOpen', true);
  }
}