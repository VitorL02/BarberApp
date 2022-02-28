import 'package:flutter/material.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0XFF121212);
const Color darkHeaderClr = Color(0XFF424242);

class Themes {
  static final darkTheme = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
  static final lightTheme = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
}
