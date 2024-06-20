import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              35.verticalSpace,
              Header(
                  text: address.id == null ? 'Add Address' : 'Update Address',
                  trailingIcon: address.id != null ? Icons.delete : null,
                  trailingTap: address.id != null
                      ? () {
                          loadingWrapper(() async {
                            await controller.deleteAddress(address);
                            Get.find<CartController>().update();
                          });
                          Get.back();
                        }
                      : null),
              35.verticalSpace,
              InputField(
                preFilledValue: address.streetAddress,
                onChanged: (val) {
                  address.streetAddress = val;
                },
                hintText: 'Street Address',
                validator: (val) => (val?.isEmpty == true)
                    ? 'Street Address is required'
                    : null,
              ),
              InputField(
                preFilledValue: address.city,
                onChanged: (val) {
                  address.city = val;
                },
                hintText: 'City',
                validator: (val) =>
                    (val?.isEmpty == true) ? 'City is required' : null,
              ),
              InputField(
                preFilledValue: address.city,
                onChanged: (val) {
                  address.country = val;
                },
                hintText: 'Country',
                validator: (val) =>
                    (val?.isEmpty == true) ? 'Country is required' : null,
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
                      validator: (val) =>
                          (val?.isEmpty == true) ? 'State is required' : null,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      keyboardType: TextInputType.number,
                      preFilledValue: '${address.zipCode ?? ''}',
                      onChanged: (val) {
                        address.zipCode = val.toInt;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                      ],
                      hintText: 'Zip Code',
                      validator: (val) => (val?.isEmpty == true)
                          ? 'Zip Code is required'
                          : null,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                    onTap: () {
                      if ((address.streetAddress?.length ?? 0) < 25) {
                        showToast(
                          message: 'Provide a detailed Street Address!',
                          imagePath: AppImages.access,
                        );
                      } else {
                        if (controller.addressFormIsValid) {
                          loadingWrapper(() async {
                            address.id != null
                                ? await controller.updateAddress(address)
                                : await controller.createAddress(address);
                            Get.find<CartController>().update();
                          });
                          Get.back();
                        }
                      }
                    },
                    text: address.id == null ? 'Save' : 'update',
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
