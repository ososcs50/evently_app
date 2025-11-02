import 'package:evently_app/Views/Splash_Screen/splash_screen.dart';
import 'package:evently_app/Views/auth/view/forgetpass.dart';
import 'package:evently_app/Views/auth/view/login_screen.dart';
import 'package:evently_app/Views/auth/view/register_screen.dart';
import 'package:evently_app/Views/layout/views/event_ui/Edit_Event/edit_event.dart';
import 'package:evently_app/Views/layout/views/event_ui/Event_Detalis/event_detalis.dart';
import 'package:evently_app/Views/layout/layout.dart';
import 'package:evently_app/Views/layout/views/event_ui/Add_Event/add_event.dart';
import 'package:evently_app/Views/onboarding/view/onboarding.dart';
import 'package:evently_app/Views/onboarding/view/start_screen.dart';
import 'package:evently_app/core/constant/extension/duration.dart';
import 'package:evently_app/core/models/event_model.dart';
import 'package:flutter/material.dart';

class ApprouteName {
  ApprouteName._();
  static const String splash = '/';
  static const String login = 'LoginScreen';
  static const String start = 'StartScreen';
  static const String onboarding = 'Onboarding';
  static const String register = 'RegisterScreen';
  static const String layout = 'layout';
  static const String addevent = 'add_event';
  static const String eventdetalis = 'Event_Detalis';
  static const String editevent = 'Event_edit';
  static const String forgetpass = 'Forget_Pass';
}

// Map<String, Widget Function(BuildContext)> routes = {
//   ApprouteName.splash: (_) => SplashScreen(),
//   ApprouteName.login: (_) => LoginScreen(),
//   ApprouteName.start: (_) => StartScreen(),
//   ApprouteName.onboarding: (_) => onboarding(),
//   ApprouteName.register: (_) => CreateAcc(),
//   ApprouteName.layout: (_) => Layout(),
// };

Route<dynamic> RouteG(RouteSettings settings) {
  switch (settings.name) {
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
      return _MR(LayoutScreen());
    case ApprouteName.addevent:
      return _PR(screen: AddEvent(), duration: 800.mill);
    case ApprouteName.eventdetalis:
      {
        var event = settings.arguments as EventModel;
        return _PR(
          screen: EventDetalis(event: event),
          duration: 800.mill,
        );
      }
    case ApprouteName.editevent:
      {
        var event = settings.arguments as EventModel;
        return _MR(EditEvent(event: event));
      }
    case ApprouteName.forgetpass:
      return _MR(Forgetpass());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
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
