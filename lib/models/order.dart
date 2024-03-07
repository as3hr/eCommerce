import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/models/product.dart';

import '../data/api_helpers.dart';

class Order {
  String? id;
  String? title;
  String? shippingDetails;
  String? status;
  int subTotal;
  Address? address;
  int shippingCost;
  int tax;
  int total;
  List<Product>? products;

  Order({
    this.id,
    this.address,
    this.products,
    this.title,
    this.shippingCost = 0,
    this.shippingDetails,
    this.status,
    this.subTotal = 0,
    this.tax = 0,
    this.total = 0,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      address: Address.fromJson(json['address']),
      shippingCost: json['shippingCost'] ?? 0,
      shippingDetails: json['shippingDetails'],
      status: json['status'],
      subTotal: json['subTotal'] ?? 0,
      tax: json['tax'] ?? 0,
      total: json['total'] ?? 0,
      id: json['_id'],
      title: json['title'],
      products: ApiHelpers.parseList(json['products'], Product.fromJson),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'shippingDetails': shippingDetails,
      'status': 'pending',
      'subTotal': subTotal,
      'shippingCost': shippingCost,
      'tax': tax,
      'total': total,
      'address': address?.id,
      'products': products?.map((product) => product.toJson()).toList() ?? [],
    };
  }
}
