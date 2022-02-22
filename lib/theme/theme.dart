import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.deepPurple;

  static const double valueRadius = 25;

  static const text20Bold = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const text20 = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
  static const text15 = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );
  static const text18Black = TextStyle(
    fontSize: 18,
    color: Colors.black87,
  );

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
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            primary.withOpacity(0.1),
          ),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          ),
        ),
      )
      // textTheme: lightTextTheme,
      );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
