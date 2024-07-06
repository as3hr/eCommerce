import 'package:e_commerce/models/order.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_items.dart';

import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/header.dart';
import 'order_detail_container.dart';
import 'order_status_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetail extends StatelessWidget {
  static const routeName = '/order-detail';
  const OrderDetail({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              35.verticalSpace,
              Header(text: 'Order #${order.id?.substring(0, 8)}'),
              OrderStatusList(
                status: order.status ?? '',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Order Items',
                  style: AppDecoration.boldStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              15.verticalSpace,
              OrderItems(order: order),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Shipping Details',
                  style: AppDecoration.boldStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              15.verticalSpace,
              OrderDetailContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      order.address?.streetAddress ?? '',
                      style: AppDecoration.boldStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
