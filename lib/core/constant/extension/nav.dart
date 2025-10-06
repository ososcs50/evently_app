import 'package:flutter/material.dart';

extension nav on BuildContext {
  go(Widget page, [Duration duration = const Duration(milliseconds: 250)]) =>
      Navigator.push(
        this,
        PageRouteBuilder(
          transitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) {
            return page;
          },
        ),
      );
  goReplacement(
    Widget page, [
    Duration duration = const Duration(milliseconds: 250),
  ]) => Navigator.pushReplacement(
    this,
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
    ),
  );
  goAndRemove(
    Widget page, [
    Duration duration = const Duration(milliseconds: 250),
  ]) => Navigator.pushAndRemoveUntil(
    this,
    PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) => page,
    ),
    (route) => false,
  );
}
