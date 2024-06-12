import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:e_commerce/screens/notification/notification_screen_controller.dart';
import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import 'data/notification_service.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(ProfileScreenController());
    Get.put(CartController());
    Get.put(OrderScreenController());
    Get.put(NotificationScreenController());
    Get.put(ChatController());
    final notificationService = NotificationService();
    notificationService.requestPermission();
  }
}
