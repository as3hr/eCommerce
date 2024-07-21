import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/jumping_dots.dart';
import 'package:ecommerce_admin_panel/screens/chat_support/components/chat_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_content.dart';
import 'chat_controller.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chats';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChatController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: controller.isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      JumpingDots(
                        color: AppColors.navy,
                        radius: 12,
                        numberOfDots: 3,
                      ),
                    ],
                  )
                : controller.allChats.isEmpty
                    ? const Center(
                        child: Text('No Chats Available!'),
                      )
                    : Row(
                        children: [
                          const ChatSideBar(),
                          Expanded(child: ChatContent()),
                        ],
                      ),
          );
        });
  }
}
