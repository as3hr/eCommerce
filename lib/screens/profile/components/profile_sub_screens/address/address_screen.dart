import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/address/empty_address.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
import '../../../../../helpers/widgets/header.dart';
import 'add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = '/address';
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              35.verticalSpace,
              Header(
                text: 'Address',
                trailingIcon: Icons.add_circle_outlined,
                trailingTap: () {
                  changePage(AddAddressScreen.routeName, arguments: {
                    'address': Address(),
                  });
                },
              ),
              35.verticalSpace,
              controller.addresses.isEmpty
                  ? const EmptyAddress()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: controller.addresses.length,
                          itemBuilder: (context, index) {
                            final address = controller.addresses[index];
                            return CustomTile(
                              width: 0.9.sw,
                              title: Text(
                                address.streetAddress ?? '',
                                style: AppDecoration.semiBoldStyle(
                                    fontSize: 18,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Text(
                                'Edit',
                                style: AppDecoration.mediumStyle(
                                    fontSize: 17, color: AppColors.lightPurple),
                              ),
                              trailingOnTap: () {
                                changePage(AddAddressScreen.routeName,
                                    arguments: {'address': address});
                              },
                            );
                          })),
            ],
          ),
        ),
      );
    });
  }
}
