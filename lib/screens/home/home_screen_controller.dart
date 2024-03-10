import 'package:e_commerce/data/api.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import '../../models/product.dart';

class HomeScreenController extends GetxController {
  int bottomSheetCurrentIndex = 0;
  void setIndex(int index) {
    bottomSheetCurrentIndex = index;
    update();
  }

  bool fetchedData = false;
  List<Product> productsList = [];
  List<Product> productsByCategory = [];

  String? title;
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
    bool byCategory = false,
  }) async {
    if (refresh) [productsList.clear(), productsByCategory.clear()];
    Map<String, dynamic> extraQuery = query ?? {};
    final page = (productsList.length / limit).ceil() + 1;
    extraQuery['limit'] = limit;
    extraQuery['page'] = page;
    if (title?.isNotEmpty == true) {
      extraQuery['title'] = title;
    }

    if (byCategory) {
      productsByCategory = await Api.getProducts(extraQuery: extraQuery);
    }
    productsList = await Api.getProducts(extraQuery: extraQuery);
    fetchedData = true;
    update();
  }

  void searchProducts(String query) {
    debouncer.call(() async {
      title = query;
      await getProducts();
    });
  }
}
