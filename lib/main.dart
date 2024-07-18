import 'package:flutter/material.dart';
import 'package:pedometer_app/splash_screen.dart';
import 'package:pedometer_app/theme.dart';
import 'dart:async';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedometer App',
      theme: lightmode,
      home: const SplashScreen(),
    );
  }
}
