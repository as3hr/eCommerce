// ignore_for_file: avoid_print

import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/helpers/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../data/api_error.dart';

Future<T?> loadingWrapper<T>(
  Future<T> Function() func, {
  bool showLoader = true,
  bool showLogs = false,
}) async {
  if (showLoader) {
    Get.context?.loaderOverlay
        .show(showOverlay: false, widgetBuilder: (_) => const Indicator());
  }
  try {
    final response = await func();
    return response;
  } on ApiError catch (e) {
    showToast(
      message: e.displayMessage,
      imagePath: AppImages.unsuccessful,
    );
  } catch (e) {
    if (showLogs) {
      print(e.toString());
    } else {
      showToast(
        message: e.toString(),
        imagePath: AppImages.unsuccessful,
      );
    }
  } finally {
    Get.context?.loaderOverlay.hide();
  }
  return null;
}

void showToast({
  required String message,
  Function(SnackbarStatus?)? snackbarStatus,
  String? title,
  Widget? imageWidget,
  void Function(GetSnackBar)? onTap,
  String imagePath = AppImages.successful,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  Duration duration = const Duration(milliseconds: 1200),
}) {
  Get.showSnackbar(
    GetSnackBar(
      onTap: onTap,
      snackbarStatus: (status) => snackbarStatus,
      snackPosition: snackPosition,
      maxWidth: 0.8.sw,
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: imageWidget ??
            Image.asset(
              imagePath,
              color: Get.theme.colorScheme.onSecondary,
            ),
      ),
      duration: duration,
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
      messageText: Text(
        message,
        maxLines: 2,
        style: TextStyle(
          color: Get.theme.colorScheme.onSecondary,
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
    ),
  );
}
