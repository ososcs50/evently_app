import 'package:evently_app/core/Services/authservices.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String _local = 'en';
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get tm => _themeMode;
  String get local => _local;
  bool get English => _local == 'en';
  bool get islight => _themeMode == ThemeMode.light;
  bool isloading = false;

  void changeTheme(ThemeMode theme) {
    _themeMode = theme;

    notifyListeners();
  }

  void changeLocal(String val) {
    _local = val;
    notifyListeners();
  }

  void Logout(BuildContext context) async {
    isloading = !isloading;
    await Authservices.Logout(context);
    isloading = !isloading;
  }
}
