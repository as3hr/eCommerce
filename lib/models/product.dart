class Product {
  String? id;
  String? title;
  String? description;
  int? price;
  bool isFav;
  int? rating;
  List<String>? size;
  int? quantity;
  String? gender;
  String? category;

  Product({
    this.isFav = false,
    this.category,
    this.description,
    this.gender,
    this.id,
    this.price,
    this.quantity,
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
        price: json['price'],
        quantity: json['quantity'],
        rating: json['rating'],
        size: json['size'] != null
            ? json['size']
                .map((size) => size.toString())
                .toList()
                .cast<String>()
            : []);
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
