import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/image_field/image_feature.dart';
import 'package:ecommerce_admin_panel/models/product.dart';
import 'package:get/get.dart';

import '../../models/data/api.dart';

class ProductController extends GetxController {
  int limit = 25;
  List<ImageFeature> images = [];
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

  void distributeImages(List<ImageFeature> newImages) {
    final fileImages = newImages;
    images = fileImages.where((image) => image.hasPath == true).toList();
    List<String> simpleImages = newImages.map((image) {
      if (image.hasPath == false) {
        return image.image;
      }
      return '';
    }).toList();
    product.images = simpleImages;
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

  Future<void> uploadImages(List<ImageFeature> images) async {
    for (final image in images) {
      final resultedImage = await Api.uploadImage(image.image);
      product.images.add(resultedImage);
    }
  }
}
