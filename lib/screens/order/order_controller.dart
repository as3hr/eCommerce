import 'package:get/get.dart';

import '../../models/data/api.dart';
import '../../models/order.dart';

class OrderController extends GetxController {
  int limit = 25;
  Order? order;
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
    final data = await Api.getAllOrders(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allOrders.addAll(data);
    update();
    if (data.length < limit) {
      return true;
    }
    return false;
  }

  Future<void> getOrderById() async {
    order = await Api.getOrderById(order?.id ?? '');
    update();
  }

  Future<void> deleteOrder() async {
    await Api.deleteOrder(order?.id ?? '');
    getAllOrders(refresh: true);
    update();
  }
}
