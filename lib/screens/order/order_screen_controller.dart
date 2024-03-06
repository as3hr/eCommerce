import 'package:e_commerce/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api.dart';

class OrderScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Order> ordersList = [];

  @override
  void onInit() async {
    super.onInit();
    await getOrders();
    tabController = TabController(length: 5, vsync: this);
  }

  Future<void> getOrders({bool refresh = false}) async {
    if (refresh) ordersList.clear();
    ordersList = await Api.getOrders();
    update();
  }
}
