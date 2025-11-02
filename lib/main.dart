import 'package:evently_app/core/manger/app_provider.dart';
import 'package:evently_app/core/route/approute.dart';
import 'package:evently_app/core/theme/themedata.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: EventlyApp(),
    ),
  );
}

final navkey = GlobalKey<NavigatorState>();

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'Localizations Evently App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.local),
      navigatorKey: navkey,
      theme: apptheme.light,
      darkTheme: apptheme.dark,
      themeMode: provider.tm,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RouteG(settings),
      initialRoute: ApprouteName.splash,
    );
  }
}
