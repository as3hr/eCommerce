import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = '/address';
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text('Address'))],
        ),
      ),
    );
  }
}
