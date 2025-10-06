import 'package:evently_app/core/manger/theme_provider.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/themedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => TProvider(),
      child: EventlyApp(),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TProvider>(context);
    return MaterialApp(
      theme: apptheme.light,
      darkTheme: apptheme.dark,
      themeMode: provider.tm,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RouteG(settings.name!),
      initialRoute: ApprouteName.splash,
    );
  }
}
