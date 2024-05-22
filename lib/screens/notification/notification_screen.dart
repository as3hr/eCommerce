import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/screens/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/widgets/form/base_form.dart';
import '../../helpers/widgets/form/form_fields.dart';
import '../../routes/route_name.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/logs';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (controller) {
      final notification = controller.notification;
      return Scaffold(
        body: Column(
          children: [
            CustomHeader(
              mainTitle: 'Create a New Notification',
              previousRoute: RouteName.notificationsList,
              formTitle: 'Notifications',
              onPressed: () {},
            ),
            Expanded(
                child: BaseForm(
                    savefunction: () async {
                      controller.createNotification().then((value) =>
                          context.goNamed(RouteName.notificationsList));
                    },
                    formFieldsList: [
                  BaseTextFieldModel(
                      title: 'Title',
                      prefixText: notification.title,
                      onSelected: (val) {
                        notification.title = val;
                      }),
                  BaseTextFieldModel(
                      title: 'Description',
                      prefixText: notification.description,
                      onSelected: (val) {
                        notification.description = val;
                      }),
                  BaseDateFieldModel(
                      title: 'Date',
                      preFilledDate: notification.date,
                      onSelected: (val) {
                        notification.date = val;
                      }),
                ]))
          ],
        ),
      );
    });
  }
}
