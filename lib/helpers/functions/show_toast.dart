import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../styles/asset_images.dart';

void showToast({
  required String message,
  Function(SnackbarStatus?)? snackbarStatus,
  String? title,
  Widget? imageWidget,
  String imagePath = AssetImages.successful,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
}) {
  Get.snackbar(
    title ?? '',
    message,
    messageText: Text(
      message,
      maxLines: 2,
      style: TextStyle(
        color: Get.theme.colorScheme.onSurface,
      ),
    ),
    titleText: title != null
        ? Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.theme.colorScheme.onSurface,
            ),
          )
        : null,
    maxWidth: 0.8.sw,
    icon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: imageWidget ??
          Image.asset(
            imagePath,
            color: Get.theme.colorScheme.onSurface,
          ),
    ),
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(10),
    backgroundGradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Get.theme.colorScheme.onPrimary,
        Get.theme.colorScheme.primary,
      ],
    ),
    borderRadius: 10,
    backgroundColor: Get.theme.colorScheme.primary,
    snackPosition: snackPosition,
  );
}
