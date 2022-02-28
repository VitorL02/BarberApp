// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:barberapp/ui/theme.dart';

class Button extends StatelessWidget {
  final String label;
  final Function() onTap;
  const Button({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryClr,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
