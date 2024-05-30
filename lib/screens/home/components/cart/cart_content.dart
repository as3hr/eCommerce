import 'package:e_commerce/helpers/functions/parse_val.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/spacer_row.dart';
import 'cart_product_list.dart';
import 'checkout/checkout_screen.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/widgets/custom_container.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  controller.removeAllProducts();
                },
                child: Text(
                  'Remove All',
                  style: AppDecoration.semiBoldStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
            ),
          ),
          const CartProductList(),
          SpacerRow(
            text1: 'Subtotal',
            text1Color: AppColors.lightGrey,
            text2: '\$${parseValToDouble(controller.order.subTotal)}',
            text2Color: Theme.of(context).colorScheme.onSecondary,
          ),
          SpacerRow(
            text1: 'Shipping Cost',
            text1Color: AppColors.lightGrey,
            text2: '\$${parseValToDouble(controller.order.shippingCost)}',
            text2Color: Theme.of(context).colorScheme.onSecondary,
          ),
          SpacerRow(
            text1: 'Tax',
            text1Color: AppColors.lightGrey,
            text2: '\$${parseValToDouble(controller.order.tax)}',
            text2Color: Theme.of(context).colorScheme.onSecondary,
          ),
          SpacerRow(
            text1: 'Total',
            text1Color: AppColors.lightGrey,
            text2: '\$${parseValToDouble(controller.order.total)}',
            text2Color: Theme.of(context).colorScheme.onSecondary,
          ),
          10.verticalSpace,
          Hero(
            tag: 'checkout-container',
            child: CustomContainer(
                height: 65,
                onTap: () {
                  changePage(CheckoutScreen.routeName);
                },
                text: 'Checkout',
                color: AppColors.lightPurple,
                textColor: AppColors.pureWhite),
          ),
        ],
      );
    });
  }
}
