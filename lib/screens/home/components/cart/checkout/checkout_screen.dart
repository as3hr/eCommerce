import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/checkout_address.dart';
import 'package:get/get.dart';

import '../../../../../helpers/widgets/header.dart';
import 'checkout_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout-screen';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Column(
          children: [
            35.verticalSpace,
            const Header(text: 'Checkout'),
            30.verticalSpace,
            const CheckoutAddress(),
            const Spacer(),
            const CheckoutFooter(),
          ],
        )),
      );
    });
  }
}
