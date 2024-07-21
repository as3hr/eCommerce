import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat_controller.dart';
import 'user_message.dart';
import 'image_message.dart';
import 'admin_message.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Expanded(
          child: ListView.builder(
              reverse: true,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                return message.isUser && message.image == null
                    ? UserMessage(message: message)
                    : message.isUser && message.image != null
                        ? ImageMessage(message: message)
                        : AdminMessage(message: message);
              }));
    });
  }
}
