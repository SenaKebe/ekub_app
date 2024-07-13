import 'package:flutter/material.dart';
import 'package:mobileapp/constant/theme_data.dart';
import 'package:mobileapp/utils/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentMode = lightMode;
  bool _isNightMode = false;

  ThemeProvider() {
    // Initialize the night mode state asynchronously
    _initNightMode();
  }

  // Initialize night mode state from SharedPreferences
  Future<void> _initNightMode() async {
    _isNightMode = (await getData('night') == 'night' ? true : false);
    _currentMode = _isNightMode ? nightMode : lightMode;
    notifyListeners();
  }

  // Getters
  ThemeData get themeData => _currentMode;
  bool get isNightMode => _isNightMode;

  // Toggle theme mode
  void toggleTheme() {
    _isNightMode = !_isNightMode;
    _currentMode = _isNightMode ? nightMode : lightMode;
    notifyListeners();
    setData('night', _isNightMode.toString());
  }

  // Setter for theme data
  void setTheme(ThemeData themeData) {
    _currentMode = themeData;
    notifyListeners();
  }
}
