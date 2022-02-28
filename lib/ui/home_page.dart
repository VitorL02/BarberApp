// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:barberapp/ui/services/notification_service.dart';
import 'package:barberapp/ui/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Hello User',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().themeSwitch();
          notifyHelper.displayNotification(
            title: 'Mudança de Tema',
            // body: Get.isDarkMode ?   "Usando o tema light" : "Usando o Tema Dark", //Troca de mensagens feita pois o getx está recebendo o pacote getx e não do _box do theme_services
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ), //Inclui itens no inicio da appBar
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
