import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
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
            backgroundColor: AppColors.white,
            body: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [
                      Container(
                        width: 0.2.sw,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          border: Border(
                              right: BorderSide(
                                  color: AppColors.grayI, width: 0.25)),
                        ),
                        child: Column(
                          children: [
                            10.verticalSpace,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8, left: 20),
                                child: Text(
                                  'Chats',
                                  style: AppDecoration.semiBoldStyle(
                                      fontSize: 25, color: AppColors.black),
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            Expanded(
                              child: ListView.builder(
                                  itemCount: controller.allChats.length,
                                  itemBuilder: (context, index) {
                                    final chat = controller.allChats[index];
                                    return InkWell(
                                      onTap: () {
                                        loadingWrapper(() async {
                                          await controller
                                              .getChatById(chat.id ?? '');
                                        }, context);
                                      },
                                      child: SizedBox(
                                        height: 60,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: chat
                                                          .user?.image !=
                                                      null
                                                  ? NetworkImage(
                                                      chat.user?.image ?? '')
                                                  : null,
                                              child: chat.user?.image != null
                                                  ? null
                                                  : const Icon(Icons.person)),
                                          title: Text(
                                              '${chat.user?.firstName ?? 'User ${index + 1}'}${chat.user?.lastName ?? ''}'),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: ChatContent()),
                    ],
                  ),
          );
        });
  }
}
