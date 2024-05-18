import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../helpers/functions/date_helper.dart';
import '../../../../models/message.dart';

class AdminMessage extends StatelessWidget {
  const AdminMessage({super.key, required this.message});
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
                padding: const EdgeInsets.all(8),
                constraints: BoxConstraints(
                  maxWidth: 0.65.sw,
                ),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                child: Text(message.text ?? ''),
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
