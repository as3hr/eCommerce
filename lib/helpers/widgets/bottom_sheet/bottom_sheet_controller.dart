import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  int bottomSheetCurrentIndex = 0;

  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }
}
