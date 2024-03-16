import 'dart:io';

import 'package:e_commerce/data/api_helpers.dart';

import 'address.dart';
import 'card.dart';

class User {
  String? id;
  String? userName;
  String? password;
  String? firstName;
  String? lastName;
  String? image;
  File? imageFile;
  String? contactNumber;
  String? email;
  String? resetCode;
  String? verificationCode;
  bool emailVerified;
  DateTime? verificationCodeExpiry;
  DateTime? resetCodeExpiry;
  List<String>? fcmTokens;
  List<Address>? addresses;
  List<Card>? cards;
  bool isSocial;
  User({
    this.isSocial = false,
    this.id,
    this.imageFile,
    this.emailVerified = false,
    this.userName,
    this.contactNumber,
    this.email,
    this.fcmTokens,
    this.firstName,
    this.lastName,
    this.image,
    this.password,
    this.addresses,
    this.cards,
    this.resetCode,
    this.resetCodeExpiry,
    this.verificationCode,
    this.verificationCodeExpiry,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      userName: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      email: json['email'],
      emailVerified: json['emailVerified'],
      fcmTokens: json['fcmTokens'] != null
          ? json['fcmTokens']
              .map((token) => token as String)
              .toList()
              .cast<String>()
          : [],
      resetCode: json['resetCode'],
      resetCodeExpiry: DateTime.tryParse(json['resetCodeExpiry'] ?? ''),
      verificationCode: json['verificationCode'],
      verificationCodeExpiry:
          DateTime.tryParse(json['verificationCodeExpiry'] ?? ''),
      contactNumber: json['contactNumber'],
      addresses: ApiHelpers.parseList(json['addresses'], Address.fromJson),
      cards: ApiHelpers.parseList(json['cards'], Card.fromJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userName': userName?.trim(),
      'firstName': firstName?.trim(),
      'lastName': lastName?.trim(),
      'email': email?.trim(),
      'password': password?.trim(),
      'contactNumber': contactNumber?.trim(),
      'card': cards?.map((card) => card.id).toList() ?? [],
      'addresses': addresses?.map((address) => address.id).toList() ?? [],
      'image': image,
      'emailVerified': emailVerified,
      'fcmTokens': fcmTokens,
      'verificationCode': verificationCode,
      'verificationCodeExpiry': verificationCodeExpiry?.toIso8601String(),
      'resetCode': resetCode,
      'resetCodeExpiry': resetCodeExpiry?.toIso8601String(),
    };
  }

  Map<String, dynamic> userSignUp() {
    return {
      'firstName': firstName?.trim(),
      'lastName': lastName?.trim(),
      'email': email?.trim(),
      'password': password?.trim(),
      'contactNumber': contactNumber?.trim(),
    };
  }
}
