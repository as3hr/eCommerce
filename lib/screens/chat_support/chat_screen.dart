import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            backgroundColor: Colors.white,
            body: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      Container(
                        color: Colors.grey.shade100,
                        width: 0.2.sw,
                        child: ListView.builder(
                            itemCount: controller.allChats.length,
                            itemBuilder: (context, index) {
                              final chat = controller.allChats[index];
                              return GestureDetector(
                                onTap: () {
                                  loadingWrapper(() async {
                                    await controller.getChatById(chat.id ?? '');
                                  }, context);
                                },
                                child: SizedBox(
                                  height: 60,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            chat.user?.image != null
                                                ? NetworkImage(
                                                    chat.user?.image ?? '')
                                                : null),
                                    title: Text(
                                        '${chat.user?.firstName ?? ''}${chat.user?.lastName ?? ''}'),
                                  ),
                                ),
                              );
                            }),
                      ),
                      10.horizontalSpace,
                      Expanded(child: ChatContent()),
                    ],
                  ),
          );
        });
  }
}
