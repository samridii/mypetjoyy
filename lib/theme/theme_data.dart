import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 226, 237, 253),
    fontFamily: 'Fredoka',

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
      ),
      headlineMedium: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F2937),
      ),
      titleMedium: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
      bodyMedium: TextStyle(fontSize: 15, color: Color(0xFF374151)),
    ),
  );
}
