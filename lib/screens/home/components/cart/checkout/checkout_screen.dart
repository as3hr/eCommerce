import 'package:e_commerce/helpers/widgets/items_expansion.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/checkout_address.dart';
import 'package:get/get.dart';

import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
            child: Column(
          children: [
            35.verticalSpace,
            const Header(text: 'Checkout'),
            30.verticalSpace,
            const CheckoutAddress(),
            ItemsExpansion(
                initiallyExpanded: true,
                titleText: 'Payment Method',
                children: [
                  SizedBox(
                    height: 0.17.sh,
                    child: ListView.builder(
                        itemCount: controller.paymentMethods.length,
                        itemBuilder: (context, index) {
                          final paymentMethod =
                              controller.paymentMethods[index];
                          controller.selectedPayment =
                              controller.selectedPaymentIndex == index;
                          return GestureDetector(
                            onTap: () {
                              controller.selectedPaymentIndex = index;
                              controller.currentPayment = paymentMethod;
                              controller.update();
                            },
                            child: CustomTile(
                              width: 1.sw,
                              title: Text(
                                paymentMethod,
                                style: AppDecoration.mediumStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                              trailing: Icon(
                                controller.selectedPayment
                                    ? Icons.check_circle_outline_rounded
                                    : Icons.circle_outlined,
                                color: AppColors.lightPurple,
                              ),
                            ),
                          );
                        }),
                  ),
                ]),
            const Spacer(),
            const CheckoutFooter(),
          ],
        )),
      );
    });
  }
}
