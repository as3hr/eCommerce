import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../error.dart';
import '../extensions/asset_images.dart';
import 'show_toast.dart';

Future<T?> loadingWrapper<T>(
  Future<T> Function() func,
) async {
  Get.context?.loaderOverlay.show();
  try {
    final response = await func();
    return response;
  } on ApiError catch (e) {
    showToast(
      message: '${e.errorCode ?? e.type.name}\n${e.toString()}',
      image: AssetImages.unsuccessful,
    );
  } catch (e, s) {
    print('loadingWrapper unknown error: ${e.toString()}\n${s.toString()}');
    showToast(
      message: '${e.toString()}}',
      image: AssetImages.unsuccessful,
    );
  } finally {
    Get.context?.loaderOverlay.hide();
  }
  return null;
}
