import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../chat_controller.dart';

class ImageDescriptionScreen extends StatelessWidget {
  const ImageDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.black,
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
              const Positioned(
                  top: 20, left: 12, child: Icon(Icons.arrow_back)),
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
                                  maxLines: 3,
                                  controller: controller.messageController,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText: 'Write Caption here...',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        )),
                                  )),
                            ),
                          ),
                          20.horizontalSpace,
                          CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 20,
                            child: GestureDetector(
                                onTap: () => controller.sendMessage(),
                                child: const Icon(Icons.send,
                                    color: Colors.white)),
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
