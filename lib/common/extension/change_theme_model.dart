import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  ChangeThemeModel() {
    _loadThemeMode();
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() async {
    _isDarkMode = _isDarkMode == false ? true : false;
    notifyListeners();

    // Lưu chế độ hiển thị vào shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedThemeMode = prefs.getBool('isDarkMode');
    print(">>>> $savedThemeMode");
    if (savedThemeMode != null) {
      _isDarkMode = savedThemeMode;
      notifyListeners();
    }
  }
}
