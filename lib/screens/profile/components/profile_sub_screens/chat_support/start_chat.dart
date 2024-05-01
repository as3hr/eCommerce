import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartChat extends StatelessWidget {
  const StartChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Center(
        child: Container(
          width: 0.75.sw,
          height: 0.4.sh,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.blueGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Text('NO ACTIVE CHATS AVAILABLE!'),
              ElevatedButton(
                  onPressed: () =>
                      loadingWrapper(() => controller.createChat()),
                  child: const Text('Start Chat with Admin'))
            ],
          ),
        ),
      );
    });
  }
}
