import 'package:ecommerce_admin_panel/helpers/functions/change_page.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenItem extends StatelessWidget {
  const ScreenItem({
    super.key,
    required this.screen,
    required this.index,
    required this.isSelected,
    required this.updateIndex,
  });
  final Screen screen;
  final int index;
  final bool isSelected;
  final void Function(int index) updateIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.navy,
      child: InkWell(
          onTap: () {
            updateIndex(index);
            changePage(context, screen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  screen.image,
                  color: isSelected ? AppColors.skyBlue : AppColors.grayI,
                ),
                5.horizontalSpace,
                Text(
                  screen.title,
                  style: AppDecoration.mediumStyle(
                      fontSize: 15,
                      color: isSelected ? AppColors.white : AppColors.grayI),
                ),
              ],
            ),
          )),
    );
  }
}
