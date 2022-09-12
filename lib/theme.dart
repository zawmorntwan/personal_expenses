import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';

ThemeData getThemeData() {
  return ThemeData(
    // App bar
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        color: accentColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    // Scaffold
    scaffoldBackgroundColor: Colors.white,

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),
  );
}
