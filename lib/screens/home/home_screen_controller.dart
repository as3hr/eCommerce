import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  int bottomSheetCurrentIndex = 0;

  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }
}
