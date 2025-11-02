import 'package:flutter/material.dart';

extension nav on BuildContext {
  go(String page) => Navigator.pushNamed(this, page);
  goReplacement(String page) => Navigator.pushReplacementNamed(this, page);
  goAndRemove(String page) =>
      Navigator.pushNamedAndRemoveUntil(this, page, (route) => false);
  pop() => Navigator.pop(this);
}
