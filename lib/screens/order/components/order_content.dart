import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:flutter/material.dart';
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
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
                dividerColor: AppColors.transparent,
                indicatorColor: AppColors.transparent,
                controller: controller.tabController,
                padding: const EdgeInsets.all(10),
                tabs: const [
                  OrderTab(text: 'Processing'),
                  OrderTab(text: 'Shipped'),
                  OrderTab(text: 'Delivered'),
                  OrderTab(text: 'Returned'),
                  OrderTab(text: 'Cancelled'),
                ]),
            Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: const [
                  OrderTabView(),
                  OrderTabView(),
                  OrderTabView(),
                  OrderTabView(),
                  OrderTabView(),
                ]))
          ],
        ),
      );
    });
  }
}
