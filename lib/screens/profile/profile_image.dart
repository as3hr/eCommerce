import 'dart:io';

import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/widgets/rounded_image.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/styles/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (controller) {
      final authController = Get.find<AuthController>();
      final name = authController.user.firstName;
      final image = authController.image;
      final isSocial = authController.user.isSocial;
      final isEmptyImage = image.isEmpty == true;
      return Center(
        child: Stack(
          children: [
            (isSocial && !isEmptyImage)
                ? RoundedImage(
                    imageUrl: image,
                    iconText: name,
                    radius: 50.w,
                  )
                : (!isEmptyImage)
                    ? RoundedImage(
                        file: File(image),
                        iconText: name,
                        radius: 50.w,
                      )
                    : RoundedImage(
                        iconText: name,
                        radius: 50.w,
                      ),
            Positioned(
                right: 7,
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    loadingWrapper(() async {
                      await controller.showOptions(context);
                    });
                  },
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.lightBlack,
                  ),
                )),
          ],
        ),
      );
    });
  }
}
