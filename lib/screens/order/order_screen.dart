import 'package:ecommerce_admin_panel/helpers/functions/change_page.dart';
import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/order/components/order_detail_first_container.dart';
import 'package:ecommerce_admin_panel/screens/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/styles/app_colors.dart';
import '../../helpers/widgets/header/custom_header.dart';
import 'components/order_detail_second_container.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      final order = controller.getCurrentOrder;
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(
                mainTitle:
                    'ORDER #${order.id?.substring(0, 6).toUpperCase()}-${order.id?.substring(7, 12).toUpperCase()}',
                previousRoute: RouteName.ordersList,
                formTitle: 'Orders',
                onPressed: () {},
              ),
              OrderDetailFirstContainer(
                  order: order,
                  onUpdate: (newOrder) {
                    loadingWrapper(() async {
                      await controller.updateOrder(newOrder);
                    }, context)
                        .then((_) => changePage(context, RouteName.ordersList));
                  }),
              OrderDetailSecondContainer(order: order),
              10.verticalSpace,
            ],
          ),
        ),
      );
    });
  }
}
