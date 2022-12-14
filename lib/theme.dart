import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/constants.dart';

ThemeData getThemeData() {
  return ThemeData(
    // primaryColor: primaryColor,
    errorColor: warnningColor,
    // Font
    fontFamily: 'Quicksand',

    // Text
    textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'OpenSans',
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'OpenSans',
            // color: primaryColor,
            fontSize: 16,
          ),
        ),

    // App bar
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        color: accentColor,
        fontSize: 20,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.bold,
      ),
    ),

    // Scaffold
    scaffoldBackgroundColor: Colors.white,

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(fontFamily: 'Quicksand'),
        ),
      ),
    ),

    // Text Button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(primaryColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    ),

    // Floating action button
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: primaryColor),
  );
}

CupertinoThemeData getCupertinoTheme() {
  return CupertinoThemeData(
    primaryColor: primaryColor,
    
  );
}