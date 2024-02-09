import 'package:flutter/material.dart';

class ThemeUtils {
  static const primaryColor = Colors.blueGrey;
  static const secondaryColor = Colors.blue;
  static get borderColor => Colors.grey.shade100;

  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: Colors.blue,
        ),
        primaryColor: primaryColor,
        useMaterial3: true,
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
          primary: primaryColor,
          secondary: Colors.blue,
        ),
        primaryColor: primaryColor,
        useMaterial3: true,
      );
}
