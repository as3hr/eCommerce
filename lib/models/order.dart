import 'package:e_commerce/helpers/functions/parse_val.dart';
import 'package:e_commerce/models/address.dart';
import 'package:e_commerce/models/product.dart';

import '../data/api_helpers.dart';

class Order {
  String? id;
  String? status;
  double subTotal;
  Address? address;
  double shippingCost;
  double tax;
  double total;
  List<Product>? products;

  Order({
    this.id,
    this.address,
    this.products,
    this.shippingCost = 0.0,
    this.status,
    this.subTotal = 0.0,
    this.tax = 0.0,
    this.total = 0.0,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      address: parseJsonToObject(json['address'], Address.fromJson),
      shippingCost: parseValToDouble(json['shippingCost']),
      status: json['status'],
      subTotal: parseValToDouble(json['subTotal']),
      tax: parseValToDouble(json['tax']),
      total: parseValToDouble(json['total']),
      id: json['_id'],
      products: ApiHelpers.parseList(json['products'], Product.fromJson),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'status': 'pending',
      'subTotal': subTotal,
      'shippingCost': shippingCost,
      'tax': tax,
      'total': total,
      'address': address?.toJson(),
      'products': products?.map((product) => product.toJson()).toList() ?? [],
    };
  }
}
