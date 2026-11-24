import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/auth.dart';

void main() => runApp(const OvercisApp());

class OvercisApp extends StatelessWidget {
  const OvercisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overcise',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}