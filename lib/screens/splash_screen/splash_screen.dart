import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../auth_screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text('R A N D O M  I M A G E'),
            // child: Image(height: 250, width: 300, image: AssetImage('')),
          )
        ]),
      ),
    );
  }
}
