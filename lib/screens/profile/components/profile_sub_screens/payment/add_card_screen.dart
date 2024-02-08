import 'package:e_commerce/helpers/widgets/custom_container.dart';
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
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
          child: Column(
        children: [
          35.verticalSpace,
          const Header(text: 'Add Card'),
          35.verticalSpace,
          InputField(
            onChanged: (val) {},
            hintText: 'Card Number',
          ),
          Row(
            children: [
              Expanded(
                child: InputField(
                  onChanged: (val) {},
                  hintText: 'CVC',
                ),
              ),
              Expanded(
                child: InputField(
                  onChanged: (val) {},
                  hintText: 'Expiry',
                ),
              ),
            ],
          ),
          InputField(
            onChanged: (val) {},
            hintText: 'Cardholder Name',
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainer(
                onTap: () {},
                text: 'Save',
                color: AppColors.lightPurple,
                textColor: AppColors.pureWhite),
          ),
        ],
      )),
    );
  }
}
