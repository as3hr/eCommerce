import 'package:e_commerce/data/api.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import '../../models/product.dart';

class HomeScreenController extends GetxController {
  String title = '';
  List<Product> productsList = [];
  List<Product> filteredProducts = [];

  int bottomSheetCurrentIndex = 0;
  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }

  bool fetchedData = false;

  int limit = 25;
  final debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  @override
  void onInit() async {
    super.onInit();
    await getProducts();
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

  void searchProducts(String query) {
    if (query.isEmpty) {
      getProducts(refresh: true);
    }
    filteredProducts = productsList
        .where((product) =>
            (product.title?.toLowerCase() ?? '').contains(query.toLowerCase()))
        .toList();
    update();
  }
}
