import 'package:e_commerce/data/api.dart';
import 'package:get/get.dart';
import '../../models/product.dart';

class HomeScreenController extends GetxController {
  Rx<String> title = ''.obs;
  List<Product> productsList = [];
  // List<Product> filteredProducts = [];

  int bottomSheetCurrentIndex = 0;
  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }

  bool fetchedData = false;
  int limit = 25;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts({
    bool refresh = false,
    Map<String, dynamic>? query,
  }) async {
    if (refresh) {
      productsList.clear();
    }
    Map<String, dynamic> extraQuery = query ?? {};
    productsList = await Api.getProducts(extraQuery: extraQuery);
    fetchedData = true;
    update();
  }

  void searchProducts() {
    debounce(
        title,
        (_) => {
              if (title.value.isNotEmpty) ...[
                fetchedData = false,
                getProducts(
                  query: {'title': title.value},
                ),
              ] else
                getProducts(refresh: true)
            },
        time: Duration(milliseconds: 1200));
  }
}
