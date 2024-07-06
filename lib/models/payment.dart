import 'package:e_commerce/models/address.dart';

class Payment {
  Address? address;
  double? amount;
  String? currency;
  String? token;
  Payment({
    this.address,
    this.amount,
    this.currency,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'amount': amount?.toInt(),
      'address': address?.toJson(),
      'currency': currency,
    };
  }
}
