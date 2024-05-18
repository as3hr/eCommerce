import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/styles/app_images.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
import '../../../../../helpers/widgets/header.dart';
import 'checkout_footer.dart';
import '../../../../profile/components/profile_sub_screens/address/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout-screen';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      final userAddress =
          Get.find<ProfileScreenController>().addresses.firstOrNull;
      controller.order.address = userAddress ?? Address();
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Column(
          children: [
            35.verticalSpace,
            const Header(text: 'Checkout'),
            30.verticalSpace,
            CustomTile(
              width: 1.sw,
              title: Text(
                'Shipping Address',
                style: AppDecoration.mediumStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              subTitle: Text(
                controller.order.address?.streetAddress ?? '',
                style: AppDecoration.mediumStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Image(
                  image: const AssetImage(AppImages.arrowForward),
                  color: Theme.of(context).colorScheme.onSecondary),
              trailingOnTap: () {
                changePage(AddAddressScreen.routeName,
                    arguments: {'address': controller.order.address});
              },
            ),
            const Spacer(),
            const CheckoutFooter(),
          ],
        )),
      );
    });
  }
}
