import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecoration {
  static InputDecoration inputFieldDecoration(
      String hintText, BuildContext context,
      {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      errorStyle: boldStyle(fontSize: 12, color: AppColors.redColor),
      errorBorder: InputBorder.none,
      errorMaxLines: 1,
      focusedErrorBorder: InputBorder.none,
      hintStyle: const TextStyle(color: AppColors.grayIV),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
      )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
      )),
    );
  }

  static TextStyle boldStyle({required double fontSize, required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle semiBoldStyle(
      {required double fontSize, required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle mediumStyle(
      {required double fontSize, required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle semiMediumStyle(
      {required double fontSize, required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle lightStyle(
      {required double fontSize, required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
      color: color,
    );
  }

  static ColorScheme scheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
}
