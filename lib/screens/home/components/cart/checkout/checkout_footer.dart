import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/functions/parse_val.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
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
          30.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'checkout-container',
              child: CustomContainer(
                  onTap: controller.order.address != null
                      ? () {
                          loadingWrapper(() async {
                            await controller.createOrder();
                          });
                        }
                      : () {
                          showToast(
                              message: 'Address is required',
                              imagePath: AppImages.access);
                        },
                  widget: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '\$${parseValToDouble(controller.order.total)}',
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
                  color: controller.order.address != null
                      ? AppColors.lightPurple
                      : AppColors.grayIV,
                  textColor: AppColors.pureWhite),
            ),
          ),
        ],
      );
    });
  }
}
