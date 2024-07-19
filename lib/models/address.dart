class Address {
  String? id;
  String? streetAddress;
  String? city;
  String? state;
  String? country;
  int? zipCode;

  Address({
    this.country,
    this.city,
    this.id,
    this.state,
    this.streetAddress,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['_id'],
      country: json['country'],
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
      'country': country,
      'state': state,
      'zipCode': zipCode,
    };
  }
}
