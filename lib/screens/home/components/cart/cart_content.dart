import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/spacer_row.dart';
import 'cart_product_list.dart';
import 'checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/widgets/custom_container.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Remove All',
                style: AppDecoration.semiBoldStyle(
                    fontSize: 18, color: AppColors.lightBlack),
              ),
            ),
          ),
          const CartProductList(),
          10.verticalSpace,
          SpacerRow(
            text1: 'Subtotal',
            text1Color: AppColors.lightGrey,
            text2: '\$200',
            text2Color: AppColors.pureBlack,
          ),
          SpacerRow(
            text1: 'Shipping Cost',
            text1Color: AppColors.lightGrey,
            text2: '\$8.00',
            text2Color: AppColors.pureBlack,
          ),
          SpacerRow(
            text1: 'Tax',
            text1Color: AppColors.lightGrey,
            text2: '\$0.00',
            text2Color: AppColors.pureBlack,
          ),
          SpacerRow(
            text1: 'Total',
            text1Color: AppColors.lightGrey,
            text2: '\$208',
            text2Color: AppColors.pureBlack,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainer(
                onTap: () {
                  changePage(CheckoutScreen.routeName);
                },
                text: 'Checkout',
                color: AppColors.lightPurple,
                textColor: AppColors.pureWhite),
          ),
        ],
      ),
    );
  }
}
