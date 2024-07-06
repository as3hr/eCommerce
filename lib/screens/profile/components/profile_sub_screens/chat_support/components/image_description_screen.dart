import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageDescriptionScreen extends StatelessWidget {
  const ImageDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.pureBlack,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Image.network(
                  controller.currentImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 20,
                left: 12,
                child: Image.asset(
                  height: 30,
                  width: 30,
                  AppImages.arrowBackward,
                  color: AppColors.pureWhite,
                ),
              ),
              Positioned(
                bottom: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.75.sw,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                  style: AppDecoration.mediumStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  cursorColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  maxLines: 3,
                                  controller: controller.messageController,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText: 'Write Caption here...',
                                    hintStyle: const TextStyle(
                                        color: AppColors.grayIV),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: AppColors.grayI,
                                          width: 1,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: AppColors.grayI,
                                          width: 1,
                                        )),
                                  )),
                            ),
                          ),
                          20.horizontalSpace,
                          CircleAvatar(
                            backgroundColor: AppColors.lightPurple,
                            radius: 20,
                            child: GestureDetector(
                                onTap: () => controller.sendMessage(),
                                child: const Icon(Icons.send,
                                    color: AppColors.pureWhite)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
