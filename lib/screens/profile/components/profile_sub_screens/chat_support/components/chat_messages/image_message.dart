import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/helpers/widgets/indicator.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/chat_support/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../helpers/functions/date_helper.dart';
import '../../../../../../../helpers/styles/app_decoration.dart';
import '../../../../../../../models/message.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                constraints: BoxConstraints(
                  maxWidth: 0.65.sw,
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.elliptical(5, -10),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GetBuilder<ChatController>(builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            controller.toggleImageSelection(
                                image: message.image);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: message.image ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                constraints: const BoxConstraints(
                                  maxHeight: 120,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Indicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      }),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text(
                            message.text ?? '',
                            style: AppDecoration.mediumStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                        )),
                  ],
                ),
              ),
              5.verticalSpace,
              Row(
                children: [
                  10.horizontalSpace,
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
        ],
      ),
    );
  }
}
