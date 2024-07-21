import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/bottom_bar/bottom_nav_bar.dart';

Future<void> changePage(String routeName,
    {bool nested = false,
    BuildContext? context,
    bool popMe = false,
    arguments,
    bool signOut = false}) async {
  if (popMe) {
    Get.offAndToNamed(routeName, arguments: arguments);
  }
  if (signOut) {
    Get.offAllNamed(routeName);
  } else if (nested) {
    Get.offNamedUntil(
      routeName,
      id: 1,
      ModalRoute.withName(BottomNavBar.routeName),
      arguments: arguments,
    );
  } else {
    Get.toNamed(routeName, arguments: arguments);
  }
}
