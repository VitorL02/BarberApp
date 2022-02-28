// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          // ignore: avoid_print
          print('Funcionado');
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
