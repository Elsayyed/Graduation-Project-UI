import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
//get and setter
  String THEME_STATE = "BLACK";

  setDarkPreference(bool value) async {
    SharedPreferences darkPref = await SharedPreferences.getInstance();
    darkPref.setBool(THEME_STATE, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences darkPref = await SharedPreferences.getInstance();

    return darkPref.getBool(THEME_STATE) ?? false;
  }
}
