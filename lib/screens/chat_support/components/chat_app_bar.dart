import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/functions/loading_wrapper.dart';
import '../../../helpers/widgets/custom_elevated_button.dart';
import '../chat_controller.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
              top: BorderSide(color: AppColors.grayI, width: 0.25),
              bottom: BorderSide(color: AppColors.grayI, width: 0.25)),
        ),
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: CircleAvatar(
                  radius: 20,
                  child: controller.currentChat.user?.image != null
                      ? CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              controller.currentChat.user?.image ?? ''),
                        )
                      : const Icon(Icons.person)),
            ),
            5.horizontalSpace,
            Text(
                '${controller.currentChat.user?.firstName ?? ''}${controller.currentChat.user?.lastName ?? ''}',
                style: mediumTextStyle),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () async {
                await loadingWrapper(() async {
                  await controller.deleteChat();
                }, context);
              },
              width: 120,
              text: 'Close chat',
              textColor: Colors.white,
              color: Colors.red,
              borderColor: Colors.red,
            ),
            10.horizontalSpace,
          ],
        ),
      );
    });
  }
}
