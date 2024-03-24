import 'package:ecommerce_admin_panel/models/product.dart';
import 'package:get/get.dart';

import '../../models/data/api.dart';

class ProductController extends GetxController {
  int limit = 25;
  Product? product;
  Product get getCurrentProduct => product ?? Product();
  set setProduct(Product newProduct) {
    product = newProduct;
  }

  List<Product> allProducts = [];

  Future<bool> getAllProducts({
    bool refresh = false,
    Map<String, dynamic>? extraQuery,
  }) async {
    if (refresh) {
      allProducts.clear();
    }
    int page = (allProducts.length / limit).ceil() + 1;
    final data = await Api.getAllProducts(
      page: page,
      limit: limit,
      extraQuery: extraQuery,
    );
    allProducts.addAll(data);
    update();
    if (data.length < limit) {
      return true;
    }
    return false;
  }

  Future<void> getProductById() async {
    product = await Api.getProductById(product?.id ?? '');
    update();
  }

  Future<void> createProduct() async {
    product = await Api.createProduct(getCurrentProduct);
    getAllProducts(refresh: true);
    update();
  }

  Future<void> updateProduct() async {
    product = await Api.updateProduct(getCurrentProduct);
    getAllProducts(refresh: true);
    update();
  }

  Future<void> deleteProduct() async {
    await Api.deleteProduct(product?.id ?? '');
    getAllProducts(refresh: true);
    update();
  }
}
