import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';
import 'category_content.dart';
import 'category_item.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1.sw,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const VerticalDivider(
              color: AppColors.transparent,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: CategoryItem.allCategories.length,
          itemBuilder: (context, index) {
            final category = CategoryItem.allCategories[index];
            return GestureDetector(
              onTap: () {
                changePage(CategoryContent.routeName,
                    arguments: {'category': category.title});
              },
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(category.image),
                        radius: 30,
                      ),
                      3.verticalSpace,
                      Text(
                        category.title,
                        style: AppDecoration.mediumStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
