import 'package:flutter/material.dart';

import '../../helpers/styles/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification-screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: Center(
        child: Text('Notification'),
      ),
    );
  }
}
