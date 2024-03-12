import 'package:e_commerce/screens/profile/components/profile_sub_screens/payment/payment_controller.dart';
import 'package:get/get.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/styles/app_images.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
import '../../../../../helpers/widgets/header.dart';
import 'add_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/styles/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PaymentController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.pureWhite,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  35.verticalSpace,
                  const Header(text: 'Payment'),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Cards',
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 17, color: AppColors.pureBlack),
                    ),
                  ),
                  10.verticalSpace,
                  CustomTile(
                    width: 1.sw,
                    title: Row(
                      children: [
                        Text(
                          '**** 4187',
                          style: AppDecoration.semiBoldStyle(
                              fontSize: 18, color: AppColors.pureBlack),
                        ),
                        5.horizontalSpace,
                        const Image(
                          image: AssetImage(AppImages.cardLogo),
                          height: 35,
                        ),
                      ],
                    ),
                    trailing:
                        const Image(image: AssetImage(AppImages.arrowForward)),
                    trailingOnTap: () {
                      changePage(AddCardScreen.routeName);
                    },
                  ),
                  10.verticalSpace,
                  CustomTile(
                    width: 1.sw,
                    title: Row(
                      children: [
                        Text(
                          '**** 4187',
                          style: AppDecoration.semiBoldStyle(
                              fontSize: 18, color: AppColors.pureBlack),
                        ),
                        5.horizontalSpace,
                        const Image(
                          image: AssetImage(AppImages.cardLogo),
                          height: 35,
                        ),
                      ],
                    ),
                    trailing:
                        const Image(image: AssetImage(AppImages.arrowForward)),
                    trailingOnTap: () {
                      changePage(AddCardScreen.routeName);
                    },
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Paypal',
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 17, color: AppColors.pureBlack),
                    ),
                  ),
                  10.verticalSpace,
                  CustomTile(
                    width: 1.sw,
                    title: Text(
                      'Cloth@gmail.com',
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 18, color: AppColors.pureBlack),
                    ),
                    trailing:
                        const Image(image: AssetImage(AppImages.arrowForward)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
