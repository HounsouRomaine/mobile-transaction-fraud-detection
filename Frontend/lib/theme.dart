import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF6366F1);
  static const bg = Color(0xFF0B1220);
  static const card = Color(0xFF111A2E);

  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bg,
    fontFamily: 'Roboto',
    useMaterial3: true,

    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: Colors.cyanAccent,
    ),
  );
}