import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/payment/payment_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../helpers/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/widgets/header.dart';
import '../../../../../helpers/widgets/input_field.dart';

class AddCardScreen extends StatelessWidget {
  static const routeName = '/add-card';
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PaymentController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
                child: Column(
              children: [
                35.verticalSpace,
                const Header(text: 'Add Card'),
                35.verticalSpace,
                InputField(
                  onChanged: (val) {
                    controller.newCard.cardHolderName = val;
                  },
                  hintText: 'Cardholder Name',
                ),
                InputField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
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
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainer(
                      onTap: () async {
                        loadingWrapper(() async {
                          await controller.addCard();
                        });
                        Get.back();
                      },
                      text: 'Save',
                      color: AppColors.lightPurple,
                      textColor: AppColors.pureWhite),
                ),
              ],
            )),
          );
        });
  }
}
