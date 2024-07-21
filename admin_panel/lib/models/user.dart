import 'dart:io';
import 'address.dart';
import 'card.dart';
import 'data/api_helpers.dart';

class User {
  String? id;
  String? userName;
  String? password;
  String? firstName;
  String? lastName;
  String? image;
  String? contactNumber;
  String? email;
  File? imageFile;
  List<String>? fcmTokens;
  List<Address>? addresses;
  List<Card>? cards;
  bool isSocial;
  bool isAdmin;
  User({
    this.isSocial = false,
    this.isAdmin = false,
    this.id,
    this.imageFile,
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      userName: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      isAdmin: json['isAdmin'],
      email: json['email'],
      fcmTokens: json['fcmTokens'] != null
          ? json['fcmTokens']
              .map((token) => token as String)
              .toList()
              .cast<String>()
          : [],
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
      'fcmTokens': fcmTokens,
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
