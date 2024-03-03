import '../../helpers/styles/app_decoration.dart';
import 'components/empty_orders.dart';
import 'components/order_content.dart';
import 'order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/styles/app_colors.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrderScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.pureWhite,
            body: SafeArea(
              child: Column(
                children: [
                  55.verticalSpace,
                  Center(
                    child: Text(
                      'Orders',
                      style: AppDecoration.boldStyle(
                          fontSize: 18, color: AppColors.pureBlack),
                    ),
                  ),
                  25.verticalSpace,
                  controller.ordersList.isEmpty
                      ? const EmptyOrders()
                      : const OrderContent()
                ],
              ),
            ),
          );
        });
  }
}
