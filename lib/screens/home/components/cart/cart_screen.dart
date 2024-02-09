import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/header.dart';
import 'package:e_commerce/screens/home/components/cart/cart_content.dart';
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
          const Expanded(child: CartContent()),
        ],
      )),
    );
  }
}
