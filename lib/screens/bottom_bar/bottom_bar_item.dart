import 'package:e_commerce/helpers/extensions/extensions.dart';

import '../../helpers/functions/change_page.dart';
import '../../helpers/styles/app_colors.dart';
import 'bottom_bar.dart';
import 'bottom_nav_bar_controller.dart';
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
                : context.isDark
                    ? AppColors.grayI
                    : AppColors.lightBlack,
          ));
    });
  }
}
