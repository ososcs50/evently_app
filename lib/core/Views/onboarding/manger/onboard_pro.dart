import 'package:flutter/material.dart';

class OnboardPro extends ChangeNotifier {
  int _current = 0;
  int get current => _current;
  PageController controller = PageController();
  void change(int val) {
    _current = val;
    notifyListeners();
  }

  void next() {
    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void Back() {
    controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
