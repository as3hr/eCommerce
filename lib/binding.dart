import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:e_commerce/screens/notification/notification_screen_controller.dart';
import 'package:e_commerce/screens/order/order_screen_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

class AllController extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(OrderScreenController());
    Get.put(ProfileScreenController());
    Get.put(NotificationScreenController());
  }
}
