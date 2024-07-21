import 'package:flutter/material.dart';

class AppDecoration {
  static TextStyle boldStyle(
      {required double fontSize,
      required Color color,
      TextOverflow? overFlow}) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: fontSize,
      color: color,
      overflow: overFlow,
    );
  }

  static TextStyle semiBoldStyle(
      {required double fontSize,
      required Color color,
      TextOverflow? overFlow}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
      overflow: overFlow,
    );
  }

  static TextStyle mediumStyle(
      {required double fontSize,
      required Color color,
      TextOverflow? overFlow}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
      overflow: overFlow,
    );
  }

  static TextStyle semiMediumStyle(
      {required double fontSize,
      required Color color,
      TextOverflow? overFlow}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
      overflow: overFlow,
    );
  }

  static TextStyle lightStyle(
      {required double fontSize,
      required Color color,
      TextOverflow? overFlow}) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: fontSize,
      color: color,
      overflow: overFlow,
    );
  }

  static ColorScheme scheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
}
