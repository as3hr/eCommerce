import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  late int bottomSheetCurrentIndex;
  late bool isSelected;

  @override
  void onInit() {
    super.onInit();
    setIndex(0);
  }

  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    isSelected = index == bottomSheetCurrentIndex;
    update();
  }
}
