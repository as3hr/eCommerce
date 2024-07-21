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
    final productsResponse =
        await Api.getAllProducts(limit: 10, extraQuery: extraQuery);
    data = productsResponse.data;
    if (data.isEmpty) {
      final productsResponse = await Api.getAllProducts(limit: 10);
      data = productsResponse.data;
    }
    products.addAll(data);
    isLoading = false;
    update();
  }
}
