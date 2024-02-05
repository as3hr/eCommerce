import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/notification/notification_screen.dart';
import 'package:e_commerce/screens/order/order_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar {
  final Function(BuildContext context) onTap;
  final String image;
  final String routeName;

  BottomBar({
    required this.image,
    required this.onTap,
    required this.routeName,
  });

  static final allBottomBarItems = [
    BottomBar(
      image: AppImages.home,
      onTap: (context) {
        changePage(HomeScreen.routeName, nested: true);
      },
      routeName: HomeScreen.routeName,
    ),
    BottomBar(
      image: AppImages.notification,
      onTap: (context) {
        changePage(NotificationScreen.routeName, nested: true);
      },
      routeName: NotificationScreen.routeName,
    ),
    BottomBar(
      image: AppImages.order,
      onTap: (context) {
        changePage(OrderScreen.routeName, nested: true);
      },
      routeName: OrderScreen.routeName,
    ),
    BottomBar(
      image: AppImages.profile,
      onTap: (context) {
        changePage(ProfileScreen.routeName, nested: true);
      },
      routeName: ProfileScreen.routeName,
    ),
  ];
}
