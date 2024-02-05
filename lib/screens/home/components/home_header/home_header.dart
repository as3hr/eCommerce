import 'package:e_commerce/helpers/functions/bottom_sheet/bottom_sheet.dart';
import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/widgets/modal_drop_down.dart';
import 'package:e_commerce/screens/home/components/category/categories_screen.dart';
import 'package:e_commerce/screens/home/components/home_header/home_gender_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/styles/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.grayI,
          ),
        ),
        ModalDropDown(
          text: 'Men',
          onTap: () {
            viewBottomSheet(
              context,
              'Gender',
              const HomeGenderBottomSheet(),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: GestureDetector(
            onTap: () {
              changePage(CategoriesScreen.routeName);
            },
            child: const CircleAvatar(
                backgroundColor: AppColors.lightPurple,
                radius: 18,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 17,
                  color: AppColors.pureWhite,
                )),
          ),
        ),
      ],
    );
  }
}
