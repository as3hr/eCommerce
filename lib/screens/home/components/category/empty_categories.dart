import 'package:e_commerce/screens/home/components/category/category_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/widgets/custom_container.dart';
import 'categories_screen.dart';

class EmptyCategories extends StatelessWidget {
  const EmptyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryScreenController>(builder: (controller) {
      return Column(
        children: [
          90.verticalSpace,
          const Image(image: AssetImage(AppImages.categorySearch)),
          5.verticalSpace,
          Text(
            "Sorry, we couldn't find any\n  matching result for your\n                Search.",
            style: AppDecoration.semiBoldStyle(
                fontSize: 25, color: AppColors.pureBlack),
          ),
          5.verticalSpace,
          CustomContainer(
            onTap: () {
              controller.extraQuery = {};
              changePage(CategoriesScreen.routeName)
                  .then((value) => Get.delete<CategoryScreenController>());
            },
            text: 'Explore Categories',
            color: AppColors.lightPurple,
            textColor: AppColors.grayI,
            width: 0.45.sw,
            height: 55,
          ),
        ],
      );
    });
  }
}
