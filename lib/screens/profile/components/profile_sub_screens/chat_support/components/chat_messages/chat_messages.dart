import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/components/chat_messages/admin_message.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/components/chat_messages/image_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_message.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Expanded(
          child: controller.messages.isEmpty && controller.messagesFetched
              ? Center(
                  child: Text(
                    'No Messages to Show !',
                    style: AppDecoration.boldStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return message.isUser && message.image == null
                        ? MyMessage(message: message)
                        : message.isUser && message.image != null
                            ? ImageMessage(message: message)
                            : AdminMessage(message: message);
                  }));
    });
  }
}
