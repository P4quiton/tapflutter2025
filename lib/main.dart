import 'package:flutter/material.dart';
import 'package:tap2025/screens/contador_screen.dart';
import 'package:tap2025/screens/dashboard_screen.dart';
import 'package:tap2025/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const LoginScreen(),
      routes: {
        "/dash" : (context) => const DashboardScreen()
      },
    );
  }
}