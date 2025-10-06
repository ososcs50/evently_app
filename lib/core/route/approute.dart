import 'package:evently_app/core/Views/Splash_Screen/splash_screen.dart';
import 'package:evently_app/core/Views/auth/view/login_screen.dart';
import 'package:evently_app/core/Views/auth/view/register_screen.dart';
import 'package:evently_app/core/Views/layout/layout.dart';
import 'package:evently_app/core/Views/onboarding/view/onboarding.dart';
import 'package:evently_app/core/Views/onboarding/view/start_screen.dart';
import 'package:evently_app/core/constant/extension/duration.dart';
import 'package:flutter/material.dart';

class ApprouteName {
  ApprouteName._();
  static const String splash = '/';
  static const String login = 'LoginScreen';
  static const String start = 'StartScreen';
  static const String onboarding = 'Onboarding';
  static const String register = 'RegisterScreen';
  static const String layout = 'layout';
}

// Map<String, Widget Function(BuildContext)> routes = {
//   ApprouteName.splash: (_) => SplashScreen(),
//   ApprouteName.login: (_) => LoginScreen(),
//   ApprouteName.start: (_) => StartScreen(),
//   ApprouteName.onboarding: (_) => onboarding(),
//   ApprouteName.register: (_) => CreateAcc(),
//   ApprouteName.layout: (_) => Layout(),
// };

Route<dynamic> RouteG(String val) {
  switch (val) {
    case ApprouteName.splash:
      return _MR(SplashScreen());
    case ApprouteName.login:
      return _PR(screen: LoginScreen(), duration: 800.mill);
    case ApprouteName.start:
      return _PR(screen: StartScreen(), duration: 800.mill);
    case ApprouteName.onboarding:
      return _MR(onboarding());
    case ApprouteName.register:
      return _PR(screen: CreateAcc(), duration: 800.mill);
    case ApprouteName.layout:
      return _MR(Layout());
    default:
      return MaterialPageRoute(builder: (context) => Layout());
  }
}

PageRouteBuilder _PR({required Widget screen, required Duration duration}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: duration,
  );
}

MaterialPageRoute _MR(Widget screen) {
  return MaterialPageRoute(builder: (context) => screen);
}
