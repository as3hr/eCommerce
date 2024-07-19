import 'package:ecommerce_admin_panel/models/pagination.dart';
import 'package:get/get.dart';

import '../../models/data/api.dart';
import '../../models/order.dart';

class OrderController extends GetxController {
  int limit = 25;
  Order? order;
  Pagination<Order> orderPagination = Pagination<Order>();
  Order get getCurrentOrder => order ?? Order();
  set setOrder(Order newOrder) {
    order = newOrder;
  }

  List<Order> allOrders = [];

  Future<bool> getAllOrders({
    bool refresh = false,
    Map<String, dynamic>? extraQuery,
  }) async {
    if (refresh) {
      allOrders.clear();
    }
    int page = (allOrders.length / limit).ceil() + 1;
    orderPagination = await Api.getAllOrders(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allOrders.addAll(orderPagination.data);
    update();
    if (orderPagination.data.length < limit) {
      return true;
    }
    return false;
  }

  Future<void> getOrderById(String id) async {
    order = await Api.getOrderById(id);
    update();
  }

  Future<void> deleteOrder() async {
    await Api.deleteOrder(order?.id ?? '');
    getAllOrders(refresh: true);
    update();
  }
}
