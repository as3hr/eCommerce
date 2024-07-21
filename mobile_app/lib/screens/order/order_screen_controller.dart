import 'package:e_commerce/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api.dart';

class OrderScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int limit = 25;
  Map<String, List<Order>> allOrdersList = {
    'pending': [],
    'cancelled': [],
    'delivered': [],
    'shipped': [],
    'returned': [],
  };

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    await getOrders();
  }

  Future<void> getOrders({bool refresh = false}) async {
    await Future.wait([
      fetchOrders(status: 'pending', refresh: refresh),
      fetchOrders(status: 'shipped', refresh: refresh),
      fetchOrders(status: 'delivered', refresh: refresh),
      fetchOrders(status: 'returned', refresh: refresh),
      fetchOrders(status: 'cancelled', refresh: refresh),
    ]);
    update();
  }

  void distributeOrders(List<Order> orders) {
    for (final order in orders) {
      order.status ??= 'pending';
      if (allOrdersList[order.status]?.isEmpty ?? true) {
        allOrdersList[order.status!] = [];
      }
      allOrdersList[order.status!]!.add(order);
    }
    update();
  }

  Future<bool> fetchOrders({
    Map<String, dynamic>? extraQuery,
    String? status,
    bool refresh = false,
  }) async {
    if (refresh) {
      if (status != null) {
        allOrdersList[status]?.clear();
      } else {
        allOrdersList.clear();
      }
    }
    final int totalOrders;
    if (status != null) {
      totalOrders = allOrdersList[status]?.length ?? 0;
      extraQuery ??= {};
      extraQuery.assign('status', status);
    } else {
      totalOrders = allOrdersList.values.fold<int>(
        0,
        (int value, List<Order> element) => value + element.length,
      );
    }
    int page = (totalOrders / limit).ceil() + 1;
    final data =
        await Api.getOrders(extraQuery: extraQuery, limit: limit, page: page);
    distributeOrders(data);

    if (data.length < limit) {
      return false;
    }
    return true;
  }
}
