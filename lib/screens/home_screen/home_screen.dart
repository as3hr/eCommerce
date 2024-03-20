import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'D A S H B O A R D',
            style: largeTextStyle,
          ))),
    );
  }
}
