import 'package:flutter/cupertino.dart';
import 'package:shopping_app_ui/services/dark_theme_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences darkThemePref = DarkThemePreferences();
  bool _darkTheme = false;
  get getTheme => _darkTheme;

  set setTheme(bool value) {
    _darkTheme = value;
    darkThemePref.setDarkPreference(value);
    notifyListeners();
  }
}
