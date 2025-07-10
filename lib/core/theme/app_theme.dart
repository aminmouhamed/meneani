import 'package:flutter/material.dart';
import 'package:meneani/core/const/constent.dart';

ThemeData lightThem = ThemeData(
  primaryColor: Colors.blue[400],

  secondaryHeaderColor: AppColors.primeryColor,
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
