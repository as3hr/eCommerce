import 'package:ecommerce_admin_panel/models/data/api.dart';
import 'package:get/get.dart';

import '../../models/user_notification.dart';

class NotificationController extends GetxController {
  List<UserNotification> allNotifications = [];
  UserNotification notification = UserNotification();
  int limit = 25;

  Future<bool> getAllNotifications({
    bool refresh = false,
    Map<String, dynamic>? extraQuery,
  }) async {
    if (refresh) {
      allNotifications.clear();
    }
    int page = (allNotifications.length / limit).ceil() + 1;
    final data = await Api.getAllNotifications(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allNotifications.addAll(data);
    update();
    if (data.length < limit) {
      return true;
    }
    return false;
  }

  Future<void> createNotification() async {
    notification = await Api.createNotification(notification);
    getAllNotifications(refresh: true);
    update();
  }
}
