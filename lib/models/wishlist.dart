class WishList {
  String? id;
  String? title;
  List<String>? products;

  WishList({
    this.id,
    this.products,
    this.title,
  });

  factory WishList.fromJson(Map<String, dynamic> json) {
    return WishList(
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
      'products': products,
    };
  }
}
