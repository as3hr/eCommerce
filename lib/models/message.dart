import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:get/get.dart';

class Message {
  String? id;
  String? chatId;
  String? text;
  String? image;
  bool isUser;
  DateTime? date;

  Message({
    this.isUser = false,
    this.text,
    this.chatId,
    this.id,
    this.date,
    this.image,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json['_id'],
        chatId: json['chatId'],
        text: json['text'],
        image: json['image'],
        isUser: json['isUser'] ?? false,
        date: DateTime.tryParse(json['date'] ?? ''));
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'userId': Get.find<AuthController>().user.id,
      'date': date?.toIso8601String(),
      'isUser': isUser,
      'text': text,
      'image': image
    };
  }
}
