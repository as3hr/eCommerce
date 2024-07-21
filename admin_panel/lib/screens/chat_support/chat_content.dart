import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_controller.dart';
import 'components/chat_messages/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/chat_app_bar.dart';
import 'components/chat_field.dart';

class ChatContent extends StatelessWidget {
  ChatContent({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ChatAppBar(),
          const ChatMessages(),
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 0.02.sw, top: 20),
            child: const ChatField(),
          ),
        ],
      );
    });
  }
}
