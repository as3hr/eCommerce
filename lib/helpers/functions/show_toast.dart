import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../extensions/asset_images.dart';

void showToast({
  required String message,
  Function(SnackbarStatus?)? snackbarStatus,
  String image = AssetImages.successful,
}) {
  Get.showSnackbar(
    GetSnackBar(
      snackbarStatus: (status) => snackbarStatus,
      maxWidth: 0.2.sw,
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          image,
          color: Get.theme.colorScheme.onSurface,
        ),
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      backgroundGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Get.theme.colorScheme.background,
          Get.theme.colorScheme.onBackground,
        ],
      ),
      borderRadius: 10,
      backgroundColor: Get.theme.colorScheme.primary,
      message: message,
      messageText: Text(
        message,
        maxLines: 5,
        style: TextStyle(
          color: Get.theme.colorScheme.onSurface,
        ),
      ),
    ),
  );
}
