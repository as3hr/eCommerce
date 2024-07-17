import 'package:ecommerce_admin_panel/models/data/api.dart';
import 'package:get/get.dart';

import '../../models/pagination.dart';
import '../../models/user_notification.dart';

class NotificationController extends GetxController {
  List<UserNotification> allNotifications = [];
  UserNotification notification = UserNotification();
  int limit = 25;
  late Pagination<UserNotification> notificationPagination;

  Future<bool> getAllNotifications({
    bool refresh = false,
    Map<String, dynamic>? extraQuery,
  }) async {
    if (refresh) {
      allNotifications.clear();
    }
    int page = (allNotifications.length / limit).ceil() + 1;
    notificationPagination = await Api.getAllNotifications(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allNotifications.addAll(notificationPagination.data);
    update();
    if (notificationPagination.data.length < limit) {
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
