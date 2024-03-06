import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/widgets/custom_container.dart';
import '../../../../../helpers/widgets/spacer_row.dart';

class CheckoutFooter extends StatelessWidget {
  const CheckoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Column(
        children: [
          SpacerRow(
            text1: 'Subtotal',
            text1Color: AppColors.lightGrey,
            text2: '\$${controller.order.subTotal.toDouble()}',
            text2Color: AppColors.pureBlack,
          ),
          SpacerRow(
            text1: 'Shipping Cost',
            text1Color: AppColors.lightGrey,
            text2: '\$${controller.order.shippingCost.toDouble()}',
            text2Color: AppColors.pureBlack,
          ),
          SpacerRow(
            text1: 'Tax',
            text1Color: AppColors.lightGrey,
            text2: '\$${controller.order.tax.toDouble()}',
            text2Color: AppColors.pureBlack,
          ),
          SpacerRow(
            text1: 'Total',
            text1Color: AppColors.lightGrey,
            text2: '\$${controller.order.total.toDouble()}',
            text2Color: AppColors.pureBlack,
          ),
          30.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainer(
                onTap: () {
                  loadingWrapper(() async {
                    await controller.createOrder();
                  });
                },
                widget: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '\$${controller.order.total.toDouble()}',
                          style: AppDecoration.boldStyle(
                              fontSize: 17, color: AppColors.pureWhite),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'Place Order',
                          style: AppDecoration.semiBoldStyle(
                              fontSize: 17, color: AppColors.pureWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                color: AppColors.lightPurple,
                textColor: AppColors.pureWhite),
          ),
        ],
      );
    });
  }
}
