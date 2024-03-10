import 'package:e_commerce/helpers/functions/parse_val.dart';

class Product {
  String? id;
  String? title;
  String? description;
  double price;
  bool isFav;
  int? rating;
  String? size;
  int quantity;
  String? gender;
  String? category;

  Product({
    this.isFav = false,
    this.category,
    this.description,
    this.gender,
    this.id,
    this.price = 0,
    this.quantity = 1,
    this.rating,
    this.size,
    this.title,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['_id'],
        isFav: json['isFav'],
        title: json['title'],
        description: json['description'],
        gender: json['gender'],
        category: json['category'],
        price: parseValToDouble(json['price']),
        quantity: json['quantity'] ?? 1,
        rating: json['rating'],
        size: json['size']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'price': price,
      'isFav': isFav,
      'rating': rating,
      'size': size,
      'quantity': quantity,
      'gender': gender,
      'category': category,
    };
  }
}
