import 'package:ecommerce_admin_panel/helpers/styles/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/styles/app_colors.dart';
import '../chat_controller.dart';

class ChatField extends StatelessWidget {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.navy,
            child: Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
          5.horizontalSpace,
          Expanded(
            child: Container(
              width: 0.5.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.grayI, width: 1)),
              constraints: BoxConstraints(maxWidth: 0.5.sw, maxHeight: 70),
              child: TextFormField(
                maxLines: 3,
                minLines: 1,
                controller: controller.messageController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Type your response here..',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.transparent,
                  )),
                ),
                onFieldSubmitted: (_) {
                  controller.sendMessage();
                },
              ),
            ),
          ),
          5.horizontalSpace,
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 25, 8),
            child: InkWell(
                onTap: () => controller.sendMessage(),
                child: Image.asset(AssetImages.send, color: Colors.black)),
          )
        ],
      );
    });
  }
}
