import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doctor_plus/common/constant/dark_mode.dart';
import 'package:flutter_doctor_plus/common/route/route_generator.dart';
import 'package:flutter_doctor_plus/feature/onboarding/screen/on_boarding.dart';
import 'package:flutter_doctor_plus/translations/export_lang.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Doctor Plus',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      // darkTheme: darkMode,
      // themeMode: themeMode,
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: OnBoarding(),
      ),
    );
  }
}
