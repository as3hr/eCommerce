class Sales {
  String? month;
  double? sales;

  Sales({
    this.month,
    this.sales,
  });

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
      month: json['month'],
      sales: json['sales'],
    );
  }
}
