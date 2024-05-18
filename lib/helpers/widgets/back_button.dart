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
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        radius: 20,
        child: Image(
          image: const AssetImage(AppImages.arrowBackward),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
