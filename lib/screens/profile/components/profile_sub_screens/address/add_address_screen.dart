import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/widgets/header.dart';
import '../../../../../helpers/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/widgets/custom_container.dart';

class AddAddressScreen extends StatelessWidget {
  static const routeName = '/add-address';
  const AddAddressScreen({super.key, required this.address});
  final Address address;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.pureWhite,
        body: SafeArea(
            child: Column(
          children: [
            35.verticalSpace,
            Header(
                text: address.id == null ? 'Add Address' : 'Update Address',
                trailingIcon: Icons.delete,
                trailingTap: () {}),
            35.verticalSpace,
            InputField(
              preFilledValue: address.streetAddress,
              onChanged: (val) {
                address.streetAddress = val;
              },
              hintText: 'Street Address',
            ),
            InputField(
              preFilledValue: address.city,
              onChanged: (val) {
                address.city = val;
              },
              hintText: 'City',
            ),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    preFilledValue: address.state,
                    onChanged: (val) {
                      address.state = val;
                    },
                    hintText: 'State',
                  ),
                ),
                Expanded(
                  child: InputField(
                    keyboardType: TextInputType.number,
                    preFilledValue: '${address.zipCode ?? ''}',
                    onChanged: (val) {
                      address.zipCode = val.toInt;
                    },
                    hintText: 'Zip Code',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                  onTap: () {
                    loadingWrapper(() async {
                      address.id != null
                          ? await controller.updateAddress(address)
                          : await controller.createAddress(address);
                    });
                  },
                  text: address.id == null ? 'Save' : 'update',
                  color: AppColors.lightPurple,
                  textColor: AppColors.pureWhite),
            ),
          ],
        )),
      );
    });
  }
}
