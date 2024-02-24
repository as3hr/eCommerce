import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_bar.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({super.key, required this.item, required this.index});
  final BottomBar item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (controller) {
      return GestureDetector(
          onTap: () {
            controller.setIndex(index);
            changePage(item.routeName, nested: true);
          },
          child: Image(
            image: AssetImage(item.image),
            color: controller.currentIndex == index
                ? AppColors.lightPurple
                : AppColors.lightBlack,
          ));
    });
  }
}
