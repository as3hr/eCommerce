import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
  }
}
