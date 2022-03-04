// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:barberapp/database/db_helper.dart';
import 'package:barberapp/ui/home_page.dart';
import 'package:barberapp/ui/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DbHelper.initDb();
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
