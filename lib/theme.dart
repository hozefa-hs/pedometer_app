import 'dart:ui';

import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF537eef),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF91ccec),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
  surfaceBright: Color(0xFFf5f8ff),
);

ThemeData lightmode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
);

NavigationBarThemeData navigationBarThemeData = NavigationBarThemeData(
  labelTextStyle: WidgetStateProperty.all(
    TextStyle(color: Color(0xFF537eef,),fontWeight: FontWeight.w500),
  ),

);
