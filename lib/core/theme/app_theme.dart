import 'package:flutter/material.dart';

ThemeData lightThem = ThemeData(
  primaryColor: Colors.blue[400],
  hintColor: Colors.black54,
  textTheme: TextTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      // backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      //backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
    ),
  ),
  buttonTheme: ButtonThemeData(
    // buttonColor: Colors.blueAccent,
    //hoverColor: Colors.blue[100],
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.white),
);

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(),
  buttonTheme: ButtonThemeData(),
  scaffoldBackgroundColor: Colors.black87,
);
