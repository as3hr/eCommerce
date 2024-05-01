import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../helpers/styles/app_colors.dart';
import '../../../../../../helpers/styles/app_decoration.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Container(
        color: AppColors.pureWhite,
        width: 1.sw,
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18, left: 13),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImages.arrowBackward),
                      )),
                  10.horizontalSpace,
                  const CircleAvatar(
                    radius: 12,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            10.horizontalSpace,
            SizedBox(
              height: 80,
              width: 0.75.sw,
              child: ListTile(
                contentPadding: const EdgeInsets.all(3),
                title: const Text('Admin, Customer Support'),
                subtitle: Text(
                  'Online',
                  style: AppDecoration.semiMediumStyle(
                      fontSize: 12, color: AppColors.green),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
