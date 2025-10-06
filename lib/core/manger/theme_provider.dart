import 'package:flutter/material.dart';

class TProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get tm => _themeMode;
  void changeTheme(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
  }
}
