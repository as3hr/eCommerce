import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/notification/notification_screen.dart';
import 'package:e_commerce/screens/order/order_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBar {
  final Function(BuildContext context) onTap;
  final IconData icon;
  final String routeName;

  BottomBar({
    required this.icon,
    required this.onTap,
    required this.routeName,
  });

  static final allBottomBarItems = [
    BottomBar(
      icon: Icons.home,
      onTap: (context) {
        changePage(HomeScreen.routeName, nested: true);
      },
      routeName: HomeScreen.routeName,
    ),
    BottomBar(
      icon: Icons.notifications_active_outlined,
      onTap: (context) {
        changePage(NotificationScreen.routeName, nested: true);
      },
      routeName: NotificationScreen.routeName,
    ),
    BottomBar(
      icon: Icons.bookmark,
      onTap: (context) {
        changePage(OrderScreen.routeName, nested: true);
      },
      routeName: OrderScreen.routeName,
    ),
    BottomBar(
      icon: Icons.person,
      onTap: (context) {
        changePage(ProfileScreen.routeName, nested: true);
      },
      routeName: ProfileScreen.routeName,
    ),
  ];
}
