import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1B5E20), // Dark green
    onPrimary: Colors.white,
    secondary: Color(0xFF4CAF50), // Bright green
    onSecondary: Colors.white,
    error: Color(0xFFB71C1C), // Dark red
    onError: Colors.white,
    background: Color(0xFFF1F8E9), // Light green-gray
    onBackground: Color(0xFF212121), // Dark gray
    surface: Color(0xFFE8F5E9), // Very light green
    onSurface: Color(0xFF424242), // Medium gray
  ),
);

ThemeData nightMode = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF388E3C), // Medium green
    onPrimary: Colors.white,
    secondary: Color(0xFF81C784), // Light green
    onSecondary: Color(0xFF212121), // Dark gray
    error: Color(0xFFEF9A9A), // Light red
    onError: Color(0xFF424242), // Medium gray
    background: Color(0xFF263238), // Dark blue-gray
    onBackground: Color(0xFFFFFFFF), // White
    surface: Color(0xFF37474F), // Dark blue-gray
    onSurface: Color(0xFFCFD8DC), // Light blue-gray
  ),
);
