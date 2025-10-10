// lib/theme/dark_mode.dart
import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black, // absolute black
  colorScheme: const ColorScheme.dark(
    surface: Colors.black, // absolute black surfaces
    primary: Colors.white, // accent on white
    secondary: Colors.blueGrey, // secondary accent
    tertiary: Colors.grey, // neutral elements
    inversePrimary: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  iconTheme: const IconThemeData(color: Colors.white70),
);
