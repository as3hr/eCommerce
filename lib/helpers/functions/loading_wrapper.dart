// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../error.dart';
import '../styles/asset_images.dart';

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
    showCustomSnackbar(context, e.displayMessage, AssetImages.unsuccessful);
  } catch (e) {
    showCustomSnackbar(context, e.toString(), AssetImages.unsuccessful);
  } finally {
    if (context.mounted) {
      context.loaderOverlay.hide();
    }
  }
  return null;
}

void showCustomSnackbar(
  BuildContext context,
  String message,
  String imagePath,
) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      right: 10, // Margin from right
      child: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.skyBlue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagePath,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
