import 'package:flutter/material.dart';

import '../../helpers/styles/app_colors.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: Center(
        child: Text('Order'),
      ),
    );
  }
}
