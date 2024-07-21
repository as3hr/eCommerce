import 'package:ecommerce_admin_panel/helpers/widgets/shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../helpers/functions/date_helper.dart';
import '../../../../../../../models/message.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../chat_controller.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 0.25.sw,
            ),
            decoration: const BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: GetBuilder<ChatController>(builder: (controller) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ShimmerImage(
                          imageUrl: message.image ?? '',
                        ));
                  }),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(message.text ?? ''),
                    )),
              ],
            ),
          ),
          5.verticalSpace,
          Row(
            children: [
              5.horizontalSpace,
              Text(DateHelper.formatDate(message.date!)),
              5.horizontalSpace,
              const Icon(
                Icons.check,
                size: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
