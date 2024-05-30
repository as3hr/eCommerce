import 'package:e_commerce/screens/bottom_bar/bottom_nav_bar.dart';
import 'package:get/get.dart';

import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/styles/app_decoration.dart';

class OrderPlaced extends StatefulWidget {
  static const routeName = '/order-placed';
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.until(ModalRoute.withName(BottomNavBar.routeName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.lightPurple,
        body: Column(
          children: [
            const Spacer(),
            const Image(image: AssetImage(AppImages.orderPlaced)),
            const Spacer(),
            Container(
              height: 0.4.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  30.verticalSpace,
                  Center(
                    child: Text(
                      "Order Placed Successfully!",
                      style: AppDecoration.boldStyle(
                          fontSize: 29,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                  10.verticalSpace,
                  Center(
                    child: Text(
                      "You will receive an email confirmation shortly!!",
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 19,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
