import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/widgets/header.dart';
import 'cart_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
          child: Column(
        children: [
          35.verticalSpace,
          const Header(
            text: 'Cart',
            extraSpace: 35,
          ),
          // const EmptyCart(),
          const CartContent(),
        ],
      )),
    );
  }
}
