import 'package:flutter/material.dart';

import '../../helpers/styles/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
