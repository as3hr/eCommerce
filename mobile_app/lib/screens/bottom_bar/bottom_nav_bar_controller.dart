import 'package:e_commerce/helpers/functions/dialog.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int currentIndex = 0;
  void setIndex(int index) {
    currentIndex = index;
    update();
  }

  Future<bool> onWillPop() async {
    final shouldPop = await confirmationDialog(
        title: 'Exit Application', message: 'Are you sure you want to Exit?');
    return shouldPop;
  }
}
