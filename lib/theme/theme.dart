import 'package:flutter/material.dart';
import 'package:pets_app/theme/colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(

    // Scaffold background color
    scaffoldBackgroundColor: Appcolors.backgroundColor,

    // Text theme
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    ),
  );
}
