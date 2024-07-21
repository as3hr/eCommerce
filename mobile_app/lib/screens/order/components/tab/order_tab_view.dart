import 'package:e_commerce/screens/order/components/empty_orders.dart';
import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/custom_tile.dart';
import '../order_detail/order_detail.dart';
import 'package:flutter/material.dart';

class OrderTabView extends StatelessWidget {
  OrderTabView({super.key, required this.status});
  final String status;
  final refreshController = RefreshController(
    initialRefresh: false,
  );

  Future<bool> fetchOrders({bool refresh = false}) {
    return Get.find<OrderScreenController>()
        .fetchOrders(status: status, refresh: refresh);
  }

  Future<void> refreshList() async {
    try {
      if (!await fetchOrders(refresh: true)) {
        refreshController.loadNoData();
      }
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  Future<void> onLoading() async {
    try {
      if (await fetchOrders()) {
        refreshController.loadComplete();
      } else {
        refreshController.loadNoData();
      }
    } catch (e) {
      refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenController>(builder: (controller) {
      final orderList = controller.allOrdersList[status] ?? [];
      return SmartRefresher(
        enablePullDown: true,
        onRefresh: refreshList,
        onLoading: onLoading,
        controller: refreshController,
        header: const ClassicHeader(),
        child: orderList.isEmpty
            ? const EmptyOrders()
            : ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  final order = orderList[index];
                  return CustomTile(
                    height: 65,
                    leading: Image(
                        image: const AssetImage(AppImages.order),
                        color: Theme.of(context).colorScheme.onSecondary),
                    title: Text(
                      '${order.id?.substring(0, 8)}',
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    subTitle: Text('${order.products?.length} items',
                        style: AppDecoration.lightStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSecondary)),
                    trailing: Image(
                      image: const AssetImage(AppImages.arrowForward),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    trailingOnTap: () {
                      changePage(OrderDetail.routeName,
                          arguments: {'order': order});
                    },
                  );
                }),
      );
    });
  }
}
