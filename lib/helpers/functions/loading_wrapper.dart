// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../error.dart';
import '../extensions/asset_images.dart';
import 'show_toast.dart';

Future<T?> loadingWrapper<T>(
  Future<T> Function() func,
  BuildContext context,
) async {
  context.loaderOverlay.show(
    widgetBuilder: (progress) => const Center(
      child: CircularProgressIndicator(
        color: Colors.deepPurple,
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
