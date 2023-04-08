import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingAppProvider with ChangeNotifier {
  late bool isLightThemeMode = true;
  late Box<dynamic> settingBox;
  late Box<dynamic> personBox;

  bool get getIsLightTheme {
    return isLightThemeMode;
  }

  void setThemeMode(bool isLight) {
    isLightThemeMode = isLight;
    writeToDB();

    notifyListeners();
  }

  Future<void> writeToDB() async {
    await settingBox.put('isDarkMode', isLightThemeMode);
    notifyListeners();
  }

  Future<void> setInitThemeMode() async {
    settingBox = await Hive.openBox('setting');
    if (settingBox.isEmpty) {
      settingBox.put('isDarkMode', false);
    }
    isLightThemeMode = await settingBox.get('isDarkMode');
    notifyListeners();
  }

  Future<void> initPersonBox() async {
    personBox = await Hive.openBox('person');
  }

  Future<void> addPersonToDb(
      {required String name, required String email}) async {
    personBox.put('name', name);
    personBox.put('email', email);
  }

  String getName() {
    if (personBox.isEmpty) {
      return '';
    } else {
      return personBox.get('name');
    }
  }

  String getEmail() {
    if (personBox.isEmpty) {
      return '';
    } else {
      return personBox.get('email');
    }
  }
}
