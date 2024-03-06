import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/custom_tile.dart';
import '../order_detail/order_detail.dart';
import 'package:flutter/material.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.ordersList.length,
          itemBuilder: (context, index) {
            final order = controller.ordersList[index];
            return CustomTile(
              height: 65,
              leading: const Image(image: AssetImage(AppImages.order)),
              title: Text(
                '${order.id?.substring(0, 8)}',
                style: AppDecoration.semiBoldStyle(
                    fontSize: 16, color: AppColors.pureBlack),
              ),
              subTitle: Text('${order.products?.length} items',
                  style: AppDecoration.lightStyle(
                      fontSize: 13, color: AppColors.pureBlack)),
              trailing: const Image(
                image: AssetImage(AppImages.arrowForward),
                color: AppColors.pureBlack,
              ),
              trailingOnTap: () {
                changePage(OrderDetail.routeName, arguments: {'order': order});
              },
            );
          });
    });
  }
}
