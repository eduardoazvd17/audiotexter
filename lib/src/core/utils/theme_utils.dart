import 'package:flutter/material.dart';

class ThemeUtils {
  static const primaryColor = Colors.blueGrey;
  static get borderColor => Colors.grey.shade100;

  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
          primary: primaryColor,
        ),
        primaryColor: primaryColor,
        useMaterial3: true,
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
          primary: primaryColor,
        ),
        primaryColor: primaryColor,
        useMaterial3: true,
      );
}
