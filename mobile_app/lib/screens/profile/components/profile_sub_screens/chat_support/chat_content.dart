import '../../../../../helpers/widgets/item_detail/components/photo_slider.dart';
import 'chat_controller.dart';
import 'components/chat_messages/chat_messages.dart';
import 'components/image_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/chat_app_bar.dart';
import 'components/chat_field.dart';

class ChatContent extends StatelessWidget {
  ChatContent({super.key});

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return controller.filePicked && controller.currentImage.isNotEmpty
          ? const ImageDescriptionScreen()
          : GestureDetector(
              onTap: () {
                controller.toggleImageSelection();
              },
              child: Stack(
                children: [
                  const Column(
                    children: [
                      ChatAppBar(),
                      ChatMessages(),
                      ChatField(),
                    ],
                  ),
                  if (controller.showImage)
                    Positioned(
                        top: 10,
                        right: 10,
                        bottom: 10,
                        left: 10,
                        child: PhotoSlider(
                          images: [controller.selectedImage],
                          pageController: pageController,
                        )),
                ],
              ),
            );
    });
  }
}
