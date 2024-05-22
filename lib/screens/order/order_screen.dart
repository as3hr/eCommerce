import 'package:ecommerce_admin_panel/helpers/widgets/form/base_form.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/form_fields.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/styles/app_colors.dart';
import '../../helpers/widgets/header/custom_header.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      final order = controller.getCurrentOrder;
      final isNew = order.id?.isEmpty ?? true;
      return Scaffold(
        backgroundColor: AppColors.grayBackground,
        body: Column(
          children: [
            CustomHeader(
              mainTitle: isNew ? '' : 'Update a Order',
              previousRoute: RouteName.ordersList,
              formTitle: 'Orders',
              onPressed: () {},
            ),
            Expanded(
              child: BaseForm(
                isNew: isNew,
                deletefunction: () async {
                  controller
                      .deleteOrder()
                      .then((value) => context.goNamed(RouteName.ordersList));
                },
                formFieldsList: [
                  if (!isNew)
                    BaseTextFieldModel(
                      title: 'Order id',
                      prefixText: order.id ?? '',
                      readOnly: true,
                    ),
                  BaseTextFieldModel(
                    title: 'Products',
                    prefixText: '${order.products?.length}',
                    readOnly: true,
                  ),
                  BaseTextFieldModel(
                    title: 'Address',
                    prefixText: order.address?.streetAddress ?? '',
                    readOnly: true,
                  ),
                  BaseNumberFieldModel(
                    title: 'TAX',
                    prefixNumber: order.tax,
                    readOnly: true,
                  ),
                  BaseNumberFieldModel(
                    title: 'Sub Total',
                    prefixNumber: order.subTotal,
                    readOnly: true,
                  ),
                  BaseNumberFieldModel(
                    title: 'Shipping Cost',
                    prefixNumber: order.shippingCost,
                    readOnly: true,
                  ),
                  BaseNumberFieldModel(
                    title: 'Total Price',
                    prefixNumber: order.total,
                    readOnly: true,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
