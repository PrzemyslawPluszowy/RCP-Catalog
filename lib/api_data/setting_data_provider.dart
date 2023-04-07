import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingAppProvider with ChangeNotifier {
  late bool isLightThemeMode = true;
  late Box<dynamic> settingBox;

  bool get getIsLightTheme {
    return isLightThemeMode;
  }

  void setThemeMode(bool isLight) {
    isLightThemeMode = isLight;
    writeToDB();

    notifyListeners();
  }

  Future<void> initDBAdapters() async {}

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
}
