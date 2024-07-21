// ignore_for_file: deprecated_member_use
import '../../routes.dart';
import 'bottom_bar.dart';
import 'bottom_bar_item.dart';
import 'bottom_nav_bar_controller.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class BottomNavBar extends StatelessWidget {
  static const routeName = '/bottom-bar';
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BottomNavBarController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: HomeScreen.routeName,
                onGenerateRoute: Routes.onGenerateRoute,
              ),
              bottomNavigationBar: Container(
                color: Theme.of(context).colorScheme.surface,
                height: 65,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: BottomBar.allBottomBarItems
                      .mapIndexed((index, item) =>
                          BottomBarItem(item: item, index: index))
                      .toList(),
                ),
              ),
            ),
          );
        });
  }
}
