import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartChat extends StatelessWidget {
  const StartChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor:
              context.isDark ? AppColors.indigo : Colors.grey.shade300,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const Center(
                        child: Icon(
                          Icons.chat,
                          color: AppColors.pureBlack,
                          size: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'No active chats available :(',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () =>
                      loadingWrapper(() => controller.createChat()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grayI,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Start Chat with Admin',
                        style: TextStyle(
                            fontSize: 16, color: AppColors.lightIndigo),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios,
                          size: 24, color: AppColors.lightIndigo),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
