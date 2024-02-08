import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/header.dart';
import 'package:e_commerce/helpers/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/widgets/custom_container.dart';

class AddAddressScreen extends StatelessWidget {
  static const routeName = '/add-address';
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
          child: Column(
        children: [
          35.verticalSpace,
          const Header(text: 'Add Address'),
          35.verticalSpace,
          InputField(
            onChanged: (val) {},
            hintText: 'Street Address',
          ),
          InputField(
            onChanged: (val) {},
            hintText: 'City',
          ),
          Row(
            children: [
              Expanded(
                child: InputField(
                  onChanged: (val) {},
                  hintText: 'State',
                ),
              ),
              Expanded(
                child: InputField(
                  onChanged: (val) {},
                  hintText: 'Zip Code',
                ),
              ),
            ],
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
