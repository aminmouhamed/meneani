import 'package:flutter/material.dart';
import 'package:naji/core/const/constent.dart';

ThemeData lightThem = ThemeData(
  primaryColor: const Color(0xFF8CE7F1),

  colorScheme: ColorScheme.light(primary: const Color(0xFF000000)),
  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),

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

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.white),
);

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(),
  buttonTheme: ButtonThemeData(),
  scaffoldBackgroundColor: Colors.black87,
);
