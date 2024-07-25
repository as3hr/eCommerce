import 'package:get/get.dart';

import '../../../../data/api.dart';
import '../../../../models/product.dart';

class CategoryScreenController extends GetxController {
  int priceSheetIndex = 0;
  int genderSheetIndex = 0;
  int sortSheetIndex = 0;
  Map<String, dynamic> extraQuery = {};
  Rx<String> title = ''.obs;
  String category = '';
  CategoryScreenController({required this.category});

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  bool fetchedData = false;
  List<Product> productsList = [];

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

  void onChanged() {
    debounce(
        title,
        (_) => {
              if (title.value.isNotEmpty) ...[
                fetchedData = false,
                extraQuery.assign('title', title.value),
                getProducts(),
              ] else ...[
                extraQuery.remove('title'),
                getProducts(refresh: true)
              ]
            },
        time: Duration(milliseconds: 1200));
  }
}
