import 'package:e_commerce/data/api.dart';
import 'package:get/get.dart';

import '../../models/product.dart';

class HomeScreenController extends GetxController {
  List<Product> productsList = [];

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  int bottomSheetCurrentIndex = 0;

  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }

  Future<void> getProducts({bool refresh = false}) async {
    if (refresh) productsList.clear();
    productsList = await Api.getProducts();
    update();
  }
}
