import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
import '../../../../../helpers/widgets/items_expansion.dart';
import '../../../../../models/address.dart';
import '../../../../profile/components/profile_sub_screens/address/add_address_screen.dart';

class CheckoutAddress extends StatelessWidget {
  const CheckoutAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      final profileController = Get.find<ProfileScreenController>();
      final userAddresses = profileController.addresses;
      if (userAddresses.isEmpty || controller.order.address == null) {
        controller.order.address = userAddresses.firstOrNull;
      }
      return ItemsExpansion(
          initiallyExpanded: true,
          titleText: 'Shipping Address',
          children: [
            if (userAddresses.isNotEmpty)
              SizedBox(
                height: userAddresses.length == 1 ? 0.07.sh : 0.1.sh,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: AppColors.pureBlack,
                        thickness: 0.5,
                        endIndent: 20,
                        indent: 20,
                      );
                    },
                    itemCount: userAddresses.length,
                    itemBuilder: (context, index) {
                      controller.selectedAddress =
                          controller.selectedAddressIndex == index;
                      final address = userAddresses[index];
                      return GestureDetector(
                        onTap: () {
                          controller.selectedAddressIndex = index;
                          controller.order.address = address;
                          controller.update();
                        },
                        child: CustomTile(
                          width: 1.sw,
                          title: Text(
                            address.streetAddress ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: AppDecoration.mediumStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          trailing: Icon(
                            controller.selectedAddress
                                ? Icons.check_circle_outline_rounded
                                : Icons.circle_outlined,
                            color: AppColors.lightPurple,
                          ),
                        ),
                      );
                    }),
              ),
            CustomTile(
              width: 1.sw,
              title: Text(
                'Add Address',
                style: AppDecoration.mediumStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              trailing: Icon(
                Icons.add_circle_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              trailingOnTap: () {
                changePage(
                  AddAddressScreen.routeName,
                  arguments: {
                    'address': Address(),
                  },
                );
              },
            )
          ]);
    });
  }
}
