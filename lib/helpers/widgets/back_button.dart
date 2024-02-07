import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_images.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: const CircleAvatar(
        backgroundColor: AppColors.grayI,
        radius: 20,
        child: Image(
          image: AssetImage(AppImages.arrowBackward),
          color: AppColors.pureBlack,
        ),
      ),
    );
  }
}
