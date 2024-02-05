import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecoration {
  static InputDecoration inputFieldDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.grayIV),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey.shade100,
      )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey.shade100,
      )),
    );
  }
}
