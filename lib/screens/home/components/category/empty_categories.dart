import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/widgets/custom_container.dart';

class EmptyCategories extends StatelessWidget {
  const EmptyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        90.verticalSpace,
        const Image(image: AssetImage(AppImages.categorySearch)),
        5.verticalSpace,
        const Text(
            "Sorry, we couldn't find any\nmatching result for your\nSearch."),
        5.verticalSpace,
        CustomContainer(
          onTap: () {},
          text: 'Explore Categories',
          color: AppColors.lightPurple,
          textColor: AppColors.grayI,
          width: 0.4.sw,
          height: 55,
        ),
      ],
    );
  }
}
