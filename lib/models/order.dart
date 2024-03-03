class Order {
  String? id;
  String? title;
  String? shippingDetails;
  String? status;
  int? subTotal;
  int? shippingCost;
  int? tax;
  int? total;
  List<String>? products;

  Order({
    this.id,
    this.products,
    this.title,
    this.shippingCost,
    this.shippingDetails,
    this.status,
    this.subTotal,
    this.tax,
    this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      shippingCost: json['shippingCost'],
      shippingDetails: json['shippingDetails'],
      status: json['status'],
      subTotal: json['subTotal'],
      tax: json['tax'],
      total: json['total'],
      id: json['_id'],
      title: json['title'],
      products: json['products'] != null
          ? json['products']
              .map((product) => product.toString())
              .toList()
              .cast<String>()
          : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'shippingDetails': shippingDetails,
      'status': status,
      'subTotal': subTotal,
      'shippingCost': shippingCost,
      'tax': tax,
      'total': total,
      'products': products,
    };
  }
}
