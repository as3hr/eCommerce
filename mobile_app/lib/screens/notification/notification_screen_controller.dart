import 'package:e_commerce/models/notification.dart';
import 'package:get/get.dart';

import '../../data/api.dart';

class NotificationScreenController extends GetxController {
  List<NotificationModel> notificationsList = [];

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  Future<void> getNotifications({bool refresh = false}) async {
    if (refresh) notificationsList.clear();
    notificationsList = await Api.getNotifications();
    update();
  }
}
