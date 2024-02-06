import 'package:flutter/material.dart';

import '../../../../helpers/styles/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text('Payment'))],
        ),
      ),
    );
  }
}
