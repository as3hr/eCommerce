import 'package:flutter/material.dart';

extension GetHeight on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension StringConvert on String {
  int get toInt => int.parse(this);
  double get toDouble => double.parse(this);
}
