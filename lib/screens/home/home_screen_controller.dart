import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  int bottomSheetCurrentIndex = 0;

  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }
}
