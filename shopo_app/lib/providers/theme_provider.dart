import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const themeStatus = "THEME_STATUS";
  bool _darkTheme = false;
  bool get getIsDarktheme => _darkTheme;

  Future<void> setDataTheme({required bool themevalue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(themeStatus, themevalue);
    _darkTheme = themevalue;

    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkTheme = prefs.getBool(themeStatus) ?? false;

    notifyListeners();
    
    return _darkTheme;
  }
}
