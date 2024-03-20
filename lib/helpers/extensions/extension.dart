import 'package:flutter/widgets.dart';

extension GetWidth on BuildContext {
  double get width => MediaQuery.of(this).size.width;
}

extension GetHeight on BuildContext {
  double get height => MediaQuery.of(this).size.height;
}
