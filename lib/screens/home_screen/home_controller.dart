import 'package:get/get.dart';

import '../../models/data/api.dart';
import '../../models/product.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    topSellingProducts();
  }

  bool isLoading = true;
  List<Product> products = [];
  Future<void> topSellingProducts() async {
    List<Product> data = [];
    const extraQuery = {
      'sort': {'sellCount': -1},
    };
    data = await Api.getAllProducts(limit: 10, extraQuery: extraQuery);
    if (data.isEmpty) {
      data = await Api.getAllProducts(limit: 10);
    }
    products.addAll(data);
    isLoading = false;
    update();
  }
}
