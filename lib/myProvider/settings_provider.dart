import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = 'en';

  changeThemeMode(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  changeLanguage(String langCode) {
    language = langCode;
    notifyListeners();
  }
}
