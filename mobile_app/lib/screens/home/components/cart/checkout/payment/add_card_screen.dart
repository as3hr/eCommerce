import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/home/components/cart/checkout/payment/payment_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../helpers/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../helpers/styles/app_colors.dart';
import '../../../../../../helpers/widgets/header.dart';
import '../../../../../../helpers/widgets/input_field.dart';

class AddCardScreen extends StatelessWidget {
  static const routeName = '/add-card';
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PaymentController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
                child: Form(
              key: controller.cardFormKey,
              child: Column(
                children: [
                  35.verticalSpace,
                  const Header(text: 'Add Card'),
                  35.verticalSpace,
                  InputField(
                    onChanged: (val) {
                      controller.newCard.cardHolderName = val;
                    },
                    validator: (val) => (val?.isEmpty == true)
                        ? 'Card Holder Name is required'
                        : null,
                    hintText: 'Cardholder Name',
                  ),
                  InputField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    validator: (val) => (val?.isEmpty == true)
                        ? 'Card Number is required'
                        : null,
                    onChanged: (val) {
                      controller.newCard.cardNumber = int.tryParse(val);
                    },
                    keyboardType: TextInputType.number,
                    hintText: 'Card Number',
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                          ],
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            controller.newCard.cvc = int.tryParse(val);
                          },
                          hintText: 'CVV',
                          validator: (val) =>
                              (val?.isEmpty == true) ? 'CVV is required' : null,
                        ),
                      ),
                      Expanded(
                        child: InputField(
                          readOnly: true,
                          isDateField: true,
                          onChanged: (val) {
                            controller.newCard.expiry = DateTime.parse(val);
                          },
                          hintText: 'Expiry (MM/YY)',
                          validator: (val) => (val?.isEmpty == true)
                              ? 'Expiry is required'
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomContainer(
                        onTap: () async {
                          if (controller.cardFormIsValid) {
                            loadingWrapper(() async {
                              await controller.addCard();
                            });
                            Get.back();
                          }
                        },
                        text: 'Save',
                        color: AppColors.lightPurple,
                        textColor: AppColors.pureWhite),
                  ),
                ],
              ),
            )),
          );
        });
  }
}
