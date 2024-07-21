class Card {
  String? id;
  String? cardHolderName;
  int? cardNumber;
  int? cvc;
  DateTime? expiry;

  Card({
    this.cardHolderName,
    this.cardNumber,
    this.cvc,
    this.expiry,
    this.id,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['_id'],
      cardHolderName: json['cardholdername'],
      cardNumber: json['cardNumber'],
      cvc: json['cvc'],
      expiry: DateTime.tryParse(json['expiry'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'cvc': cvc,
      'expiry': expiry?.toIso8601String(),
    };
  }
}
