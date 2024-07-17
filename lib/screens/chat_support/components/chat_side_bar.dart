import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_panel/screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/functions/loading_wrapper.dart';
import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';
import '../../../helpers/widgets/shimmer_effect.dart';

class ChatSideBar extends StatelessWidget {
  const ChatSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Container(
        width: 0.2.sw,
        decoration: const BoxDecoration(
          color: AppColors.white,
          border:
              Border(right: BorderSide(color: AppColors.grayI, width: 0.25)),
        ),
        child: Column(
          children: [
            10.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 20),
                child: Text(
                  'Chats',
                  style: AppDecoration.semiBoldStyle(
                      fontSize: 25, color: AppColors.black),
                ),
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: controller.allChats.length,
                  itemBuilder: (context, index) {
                    final chat = controller.allChats[index];
                    return InkWell(
                      onTap: () {
                        loadingWrapper(() async {
                          await controller.getChatById(chat.id ?? '');
                        }, context);
                      },
                      child: Container(
                        color: chat.id == controller.currentChat.id
                            ? AppColors.offWhite
                            : AppColors.white,
                        height: 60,
                        child: Row(
                          children: [
                            15.horizontalSpace,
                            CircleAvatar(
                                radius: 20,
                                child: chat.user?.image != null
                                    ? CachedNetworkImage(
                                        width: 120,
                                        imageUrl: chat.user!.image!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                                BlendMode.dst,
                                              ),
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const ShimmerEffect(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.person),
                                      )
                                    : const Icon(Icons.person)),
                            8.horizontalSpace,
                            Text(
                              '${chat.user?.firstName ?? 'User ${index + 1}'}${chat.user?.lastName ?? ''}',
                              style: AppDecoration.semiMediumStyle(
                                  fontSize: 18, color: AppColors.deepBlack),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
