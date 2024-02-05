import 'package:e_commerce/screens/notification/components/notifications_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/styles/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification-screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              50.verticalSpace,
              const Center(child: Text('Notifications')),
              // const EmptyNotifications(),
              15.verticalSpace,
              const NotificationList(),
            ],
          ),
        ),
      ),
    );
  }
}
