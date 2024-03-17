import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<bool> confirmationDialog({
  required String title,
  required String message,
}) async {
  bool exit = await showDialog(
    context: Get.context!,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        ),
      ],
    ),
  );
  return exit;
}
