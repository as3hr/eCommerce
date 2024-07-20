import 'package:get/get.dart';

class SideBarController extends GetxController {
  bool showItems = true;
  int currentIndex = 0;

  void toggleShowItems() {
    showItems = !showItems;
    update();
  }

  void setIndex(int index) {
    currentIndex = index;
    update();
  }
}
