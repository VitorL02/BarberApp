// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:barberapp/ui/home_page.dart';
import 'package:barberapp/ui/services/theme_services.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'ui/theme.dart';

// ignore: prefer_typing_uninitialized_variables
const projectId = "barberapp-79994";
const apiKey = "AIzaSyAUjPtL6jyQqn1pn-8Uim_l60WWFdseGwc";

void main() {
  Firestore.initialize(projectId);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Agende seu Horario',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeService().theme,
      color: Colors.white,
      // ignore: prefer_const_constructors
      home: HomePage(),
    );
  }
}
