import 'package:e_commerce/screens/home/components/cart/checkout/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../helpers/styles/app_decoration.dart';
import '../../../../../../../helpers/styles/app_images.dart';
import '../../../../../../../helpers/widgets/input_field.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.cards.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 60,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${controller.cards.first.cardNumber}',
                              style: AppDecoration.semiBoldStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                            5.horizontalSpace,
                            const Image(
                              image: AssetImage(AppImages.cardLogo),
                              height: 35,
                            ),
                          ],
                        ),
                      ))),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Payment Form',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          10.verticalSpace,
          InputField(
            readOnly: true,
            preFilledValue: controller.amount.toString(),
            onChanged: (val) {
              controller.amount = double.tryParse(val) ?? 0;
              controller.checkPaymentValidity();
            },
            keyboardType: TextInputType.number,
            hintText: 'Add Amount',
          ),
          10.verticalSpace,
          InputField(
            readOnly: true,
            preFilledValue: controller.currency,
            onChanged: (val) {
              controller.currency = val;
              controller.checkPaymentValidity();
            },
            hintText: 'Add Currency',
          ),
        ],
      );
    });
  }
}
