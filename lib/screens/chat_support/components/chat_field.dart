import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../chat_controller.dart';

class ChatField extends StatelessWidget {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Row(
        children: [
          Container(
            width: 0.5.sw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1.7)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  maxLines: 3,
                  minLines: 1,
                  controller: controller.messageController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
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
                  onFieldSubmitted: (_) => controller.sendMessage(),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          color: Colors.black,
                        )
                      ],
                    ),
                    child: GestureDetector(
                        onTap: () => controller.sendMessage(),
                        child: const Icon(Icons.send, color: Colors.black)),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
