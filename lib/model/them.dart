import 'package:flutter/material.dart';

class MyTheme {
  static final lighttheme = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.red,
    ),
    textTheme: TextTheme(
        headline6: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    )),
  );
}
