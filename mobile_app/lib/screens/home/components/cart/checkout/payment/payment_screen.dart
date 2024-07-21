import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/widgets/indicator.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/payment/components/payment_form.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/payment/payment_controller.dart';
import 'package:get/get.dart';

import '../../../../../../helpers/functions/change_page.dart';
import '../../../../../../helpers/styles/app_decoration.dart';
import '../../../../../../helpers/styles/app_images.dart';
import '../../../../../../helpers/widgets/custom_container.dart';
import '../../../../../../helpers/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../helpers/styles/app_colors.dart';
import 'add_card_screen.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentScreen({
    super.key,
    required this.amount,
    required this.currency,
  });
  final String currency;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PaymentController(),
        builder: (controller) {
          controller.amount = amount.toPrecision(2);
          controller.currency = currency;
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: controller.isLoading
                ? const Indicator()
                : SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        35.verticalSpace,
                        const Header(text: 'Payment'),
                        35.verticalSpace,
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Cards',
                                style: AppDecoration.semiBoldStyle(
                                    fontSize: 17,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                            ),
                            const Spacer(),
                            Center(
                              child: CustomContainer(
                                width: 0.25.sw,
                                height: 0.035.sh,
                                fontSize: 17,
                                color: AppColors.lightPurple,
                                textColor: AppColors.densedWhite,
                                onTap: () {
                                  changePage(AddCardScreen.routeName);
                                },
                                text: 'Add Card',
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        const PaymentForm(),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomContainer(
                              onTap: controller.cards.isEmpty ||
                                      controller.amount == 0 &&
                                          controller.currency.isEmpty
                                  ? () {
                                      showToast(
                                        message:
                                            'Complete the form and add a card to proceed',
                                        imagePath: AppImages.access,
                                      );
                                    }
                                  : () {
                                      loadingWrapper(() async {
                                        await controller.createPayment();
                                      });
                                    },
                              text: 'Create Payment',
                              color: controller.cards.isEmpty ||
                                      controller.amount == 0 &&
                                          controller.currency.isEmpty
                                  ? AppColors.lightGrey
                                  : AppColors.lightPurple,
                              textColor: AppColors.pureWhite),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
