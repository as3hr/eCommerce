import 'package:e_commerce/data/api_helpers.dart';

import 'product.dart';

class WishList {
  String? id;
  String? title;
  List<Product>? products;

  WishList({
    this.id,
    this.products,
    this.title,
  });

  factory WishList.fromJson(Map<String, dynamic> json) {
    return WishList(
      id: json['_id'],
      title: json['title'],
      products: ApiHelpers.parseList(json['products'], Product.fromJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'products': products?.map((product) => product.id).toList() ?? [],
    };
  }
}
