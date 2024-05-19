import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../models/message.dart';
import '../../../../helpers/functions/date_helper.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                constraints: BoxConstraints(
                  maxWidth: 0.65.sw,
                ),
                decoration: const BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                child: Text(message.text ?? ''),
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
