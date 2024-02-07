import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_images.dart';
import '../../../helpers/widgets/custom_container.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        290.verticalSpace,
        const Center(
          child: Image(image: AssetImage(AppImages.checkOut)),
        ),
        15.verticalSpace,
        CustomContainer(
          onTap: () {},
          text: 'Explore Categories',
          color: AppColors.lightPurple,
          textColor: AppColors.grayI,
          width: 0.45.sw,
          height: 55,
        ),
      ],
    );
  }
}
