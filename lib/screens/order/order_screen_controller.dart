import 'package:e_commerce/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api.dart';

class OrderScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Order> ordersList = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    getOrders();
  }

  Future<void> getOrders({bool refresh = false}) async {
    if (refresh) ordersList.clear();
    ordersList = await Api.getOrders();
    update();
  }
}
