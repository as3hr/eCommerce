import 'package:flutter/material.dart';

import '../../../../helpers/styles/app_colors.dart';

class SupportScreen extends StatelessWidget {
  static const routeName = '/support';
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text('Support'))],
        ),
      ),
    );
  }
}
