import 'package:flutter/material.dart';

extension GetWidth on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension GetHeight on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
}
