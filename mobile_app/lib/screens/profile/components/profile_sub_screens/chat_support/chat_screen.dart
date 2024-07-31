import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_content.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/start_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat-route';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChatController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
                child: controller.isLoading
                    ? const SizedBox()
                    : controller.myChat.id != null
                        ? ChatContent()
                        : const StartChat()),
          );
        });
  }
}
