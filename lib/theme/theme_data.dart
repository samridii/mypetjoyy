import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE6F0FF),
    fontFamily: 'Fredoka',

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F2937),
      ),
      titleMedium: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF374151)),
    ),
  );
}
