import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
  ).copyWith(
    secondary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    foregroundColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.blueGrey[700],
      foregroundColor: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey[700],
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.0,
      fontFamily: 'Hind',
    ),
    displayMedium: TextStyle(
      fontSize: 18.0,
      fontFamily: 'Hind',
    ),
    displaySmall: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Hind',
    ),
  ),
  scaffoldBackgroundColor: Colors.grey[800],
);
