import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool?> confirmationDialog(
  String text,
) {
  return Get.dialog<bool>(
    AlertDialog(
      title: Text(
        text,
      ),
      actions: [
        TextButton(
          child: const Text('Yes'),
          onPressed: () async {
            Get.back(result: true);
          },
        ),
        TextButton(
          child: const Text('No'),
          onPressed: () => Get.back(result: false),
        ),
      ],
    ),
  );
}
