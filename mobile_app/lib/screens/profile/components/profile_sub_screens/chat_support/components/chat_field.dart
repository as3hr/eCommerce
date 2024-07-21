import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../helpers/styles/app_colors.dart';

class ChatField extends StatelessWidget {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 0.75.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 1.7)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () => controller.showOptions(context),
                      child: Icon(
                        Icons.add,
                        color: context.isDark
                            ? AppColors.lightIndigo
                            : AppColors.grayIV,
                      ),
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                          maxLines: 3,
                          minLines: 1,
                          cursorColor:
                              Theme.of(context).colorScheme.onSecondary,
                          controller: controller.messageController,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Type your query here..',
                            hintStyle: TextStyle(color: AppColors.grayIV),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.transparent,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.transparent,
                            )),
                          ))),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: AppColors.lightBlack,
                )
              ],
            ),
            child: GestureDetector(
                onTap: () => controller.sendMessage(),
                child: const Icon(Icons.send, color: AppColors.grayIV)),
          )
        ],
      );
    });
  }
}
