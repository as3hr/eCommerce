import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../styles/app_decoration.dart';

Future<bool> confirmationDialog({
  required String title,
  required String message,
}) async {
  bool exit = await showDialog(
    context: Get.context!,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        title,
        style: AppDecoration.mediumStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),
      ),
      content: Text(
        message,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: Theme.of(context).colorScheme.onSecondary),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'No',
            style: AppDecoration.mediumStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            'Yes',
            style: AppDecoration.mediumStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ],
    ),
  );
  return exit;
}
