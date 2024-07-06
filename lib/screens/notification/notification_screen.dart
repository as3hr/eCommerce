import '../../helpers/styles/app_decoration.dart';
import 'components/empty_notifications.dart';
import 'components/notifications_list.dart';
import 'notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification-screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    50.verticalSpace,
                    Center(
                        child: Text(
                      'Notifications',
                      style: AppDecoration.boldStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
                    20.verticalSpace,
                    controller.notificationsList.isEmpty
                        ? const EmptyNotifications()
                        : NotificationList(
                            notifications: controller.notificationsList,
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
