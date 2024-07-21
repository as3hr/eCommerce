import '../../../helpers/styles/app_decoration.dart';
import '../order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/styles/app_colors.dart';
import 'tab/order_tab.dart';
import 'tab/order_tab_view.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenController>(builder: (controller) {
      return Expanded(
        child: Column(
          children: [
            TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                overlayColor: WidgetStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
                labelStyle: AppDecoration.mediumStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary),
                unselectedLabelStyle: AppDecoration.mediumStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSecondary),
                dividerColor: AppColors.transparent,
                indicatorColor: AppColors.transparent,
                controller: controller.tabController,
                padding: const EdgeInsets.all(10),
                tabs: [
                  OrderTab(text: 'Processing', width: 0.24.sw),
                  OrderTab(text: 'Shipped', width: 0.24.sw),
                  OrderTab(text: 'Delivered', width: 0.24.sw),
                  OrderTab(text: 'Returned', width: 0.24.sw),
                  OrderTab(text: 'Cancelled', width: 0.24.sw),
                ]),
            Expanded(
                child:
                    TabBarView(controller: controller.tabController, children: [
              OrderTabView(status: 'pending'),
              OrderTabView(status: 'shipped'),
              OrderTabView(status: 'delivered'),
              OrderTabView(status: 'returned'),
              OrderTabView(status: 'cancelled'),
            ]))
          ],
        ),
      );
    });
  }
}
