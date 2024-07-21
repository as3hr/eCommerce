import '../../helpers/styles/app_colors.dart';
import '../../helpers/styles/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Image(
              image: AssetImage(AppImages.logo),
            ),
          )
        ]),
      ),
    );
  }
}
