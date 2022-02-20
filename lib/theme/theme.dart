import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.deepPurple;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.grey[300],
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primary,
          width: 2,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      iconColor: primary,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
    ),
    // textTheme: lightTextTheme,
  );

  // static const TextTheme lightTextTheme = TextTheme();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
