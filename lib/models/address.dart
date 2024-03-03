import 'package:flutter_stripe/flutter_stripe.dart';

class Address {
  String? id;
  String? streetAddress;
  String? city;
  String? state;
  int? zipCode;

  Address({
    this.city,
    this.id,
    this.state,
    this.streetAddress,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['_id'],
      streetAddress: json['streetAddress'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'zipCOde': zipCode,
    };
  }
}
