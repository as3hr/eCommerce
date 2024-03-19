import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:get/get.dart';

import '../../../../data/api.dart';
import '../../../../models/product.dart';

class CategoryScreenController extends GetxController {
  int priceSheetIndex = 0;
  int genderSheetIndex = 0;
  int sortSheetIndex = 0;
  Map<String, dynamic> extraQuery = {};
  String title = '';
  String category = '';
  CategoryScreenController({required this.category});

  @override
  void onInit() {
    super.onInit();
    loadingWrapper(getProducts);
  }

  bool fetchedData = false;
  List<Product> productsList = [];
  List<Product> filteredProducts = [];

  Future<void> getProducts({
    bool refresh = false,
  }) async {
    fetchedData = false;
    extraQuery['category'] = category;
    if (refresh) {
      productsList.clear();
    }
    productsList = await Api.getProducts(extraQuery: extraQuery);
    fetchedData = true;
    update();
  }

  void onChanged(String query) {
    if (query.isEmpty) {
      getProducts();
      update();
    }
    filteredProducts = productsList
        .where((product) =>
            (product.title?.toLowerCase() ?? '').contains(query.toLowerCase()))
        .toList();
    update();
  }
}
