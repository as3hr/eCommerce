import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/bottom_bar/bottom_nav_bar.dart';

void changePage(String routeName,
    {bool nested = false, BuildContext? context}) {
  if (nested) {
    Get.offNamedUntil(
      routeName,
      id: 1,
      ModalRoute.withName(BottomNavBar.routeName),
    );
  } else {
    Get.toNamed(routeName);
  }
}
