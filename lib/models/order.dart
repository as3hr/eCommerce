import 'address.dart';
import 'data/api_helpers.dart';
import 'product.dart';

class Order {
  String? id;
  String? shippingDetails;
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
    this.shippingDetails,
    this.status,
    this.subTotal = 0.0,
    this.tax = 0.0,
    this.total = 0.0,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      address: Address.fromJson(json['address']),
      shippingCost: ApiHelpers.parseValToDouble(json['shippingCost']),
      shippingDetails: json['shippingDetails'],
      status: json['status'],
      subTotal: ApiHelpers.parseValToDouble(json['subTotal']),
      tax: ApiHelpers.parseValToDouble(json['tax']),
      total: ApiHelpers.parseValToDouble(json['total']),
      id: json['_id'],
      products: ApiHelpers.parseList(json['products'], Product.fromJson),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'shippingDetails': shippingDetails,
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
