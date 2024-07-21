import 'package:e_commerce/data/api_helpers.dart';
import 'package:e_commerce/models/product.dart';

class Wish {
  String? id;
  String? title;
  List<Product>? products;

  Wish({
    this.id,
    this.products,
    this.title,
  });

  factory Wish.fromJson(Map<String, dynamic> json) {
    return Wish(
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
