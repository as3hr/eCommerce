import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/widgets/shimmer_effect.dart';
import '../chat_controller.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
              top: BorderSide(color: AppColors.grayI, width: 0.25),
              bottom: BorderSide(color: AppColors.grayI, width: 0.25)),
        ),
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: CircleAvatar(
                  radius: 20,
                  child: controller.currentChat.user?.image != null
                      ? CachedNetworkImage(
                          width: 120,
                          imageUrl: controller.currentChat.user?.image ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onPrimary,
                                  BlendMode.dst,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const ShimmerEffect(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person),
                        )
                      : const Icon(Icons.person)),
            ),
            5.horizontalSpace,
            SizedBox(
              height: 80,
              width: 0.2.sw,
              child: ListTile(
                contentPadding: const EdgeInsets.all(3),
                title: Text(
                    '${controller.currentChat.user?.firstName ?? ''}${controller.currentChat.user?.lastName ?? ''}'),
                subtitle: const Text(
                  'Online',
                  style: TextStyle(color: AppColors.green),
                ),
              ),
            ),
            const Spacer(),
            const Icon(Icons.settings),
            10.horizontalSpace,
          ],
        ),
      );
    });
  }
}
