// ignore_for_file: avoid_print

import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../error.dart';
import '../styles/asset_images.dart';
import 'show_toast.dart';

Future<T?> loadingWrapper<T>(
  Future<T> Function() func,
  BuildContext context,
) async {
  context.loaderOverlay.show(
    widgetBuilder: (progress) => const Center(
      child: CircularProgressIndicator(
        color: AppColors.navy,
      ),
    ),
  );
  try {
    final response = await func();
    return response;
  } on ApiError catch (e) {
    showToast(
      message: e.displayMessage,
      imagePath: AssetImages.unsuccessful,
    );
  } catch (e) {
    showToast(
      message: e.toString(),
      imagePath: AssetImages.unsuccessful,
    );
  } finally {
    if (context.mounted) {
      context.loaderOverlay.hide();
    }
  }
  return null;
}
