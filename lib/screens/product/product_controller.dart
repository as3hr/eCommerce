import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/image_field/image_type.dart';
import 'package:ecommerce_admin_panel/models/product.dart';
import 'package:get/get.dart';

import '../../models/data/api.dart';

class ProductController extends GetxController {
  int limit = 25;
  List<ImageType> images = [];
  Product product = Product();
  Product get getCurrentProduct => product;
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

  void distributeImages(List<ImageType> newImages) {
    final fileImages = newImages;
    images = fileImages.where((image) => image.hasPath == true).toList();
    final simpleImages =
        newImages.where((image) => image.hasPath == false).toList();
    product.images = simpleImages.map((image) => image.image).toList();
  }

  Future<void> getProductById() async {
    product = await Api.getProductById(product.id ?? '');
    update();
  }

  Future<void> createProduct() async {
    if (images.isNotEmpty) {
      await uploadImages(images);
      product = await Api.createProduct(getCurrentProduct);
    } else {
      product = await Api.createProduct(getCurrentProduct);
    }
    getAllProducts(refresh: true);
    update();
  }

  Future<void> updateProduct() async {
    if (images.isNotEmpty) {
      await uploadImages(images);
      product = await Api.updateProduct(getCurrentProduct);
    } else {
      product = await Api.updateProduct(getCurrentProduct);
    }
    getAllProducts(refresh: true);
    update();
  }

  Future<void> deleteProduct() async {
    await Api.deleteProduct(product.id ?? '');
    getAllProducts(refresh: true);
    update();
  }

  Future<void> uploadImages(List<ImageType> images) async {
    for (final image in images) {
      final resultedImage =
          await Api.uploadImage(image.image, image.imageName ?? '');
      product.images.add(resultedImage);
    }
  }
}
