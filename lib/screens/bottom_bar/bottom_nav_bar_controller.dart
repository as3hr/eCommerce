import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    update();
  }
}
