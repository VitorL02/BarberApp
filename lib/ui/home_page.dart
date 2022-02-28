// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:barberapp/ui/services/notification_service.dart';
import 'package:barberapp/ui/services/theme_services.dart';
import 'package:barberapp/ui/theme.dart';
import 'package:barberapp/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: subHeadStyle,
                      ),
                      Text(
                        'Hoje',
                        style: headingStyle,
                      ),
                    ],
                  ),
                ),
                Button(
                  label: "+ Novo Horário",
                  onTap: () => null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,

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
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ), //Inclui itens no inicio da appBar
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/222.jpg",
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
