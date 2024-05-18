import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../chat_controller.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Container(
        color: Colors.white,
        height: 80,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 18, left: 13),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            10.horizontalSpace,
            SizedBox(
              height: 80,
              width: 0.5.sw,
              child: ListTile(
                contentPadding: const EdgeInsets.all(3),
                title: Text(
                    '${controller.currentChat.user?.firstName ?? ''}${controller.currentChat.user?.lastName ?? ''}'),
                subtitle: const Text(
                  'Online',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
