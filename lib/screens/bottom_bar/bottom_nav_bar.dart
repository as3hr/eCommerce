import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_bar.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_bar_item.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_nav_bar_controller.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
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
          return PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: AppColors.pureWhite,
              body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: HomeScreen.routeName,
                onGenerateRoute: Routes.onGenerateRoute,
              ),
              bottomNavigationBar: Container(
                color: AppColors.pureWhite,
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
