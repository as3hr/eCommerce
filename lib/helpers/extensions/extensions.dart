import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

extension GetHeight on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isDark => AdaptiveTheme.of(this).mode.isDark;
  bool get isLight => AdaptiveTheme.of(this).mode.isLight;
}

extension StringConvert on String {
  int get toInt => int.parse(this);
  double get toDouble => double.parse(this);
}
