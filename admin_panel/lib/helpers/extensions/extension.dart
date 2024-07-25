import 'package:flutter/widgets.dart';

extension GetWidth on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isMax => (MediaQuery.of(this).size.width >= 1500 &&
      MediaQuery.of(this).size.height >= 700);
  bool get isMin => (MediaQuery.of(this).size.width < 1200 ||
      MediaQuery.of(this).size.height < 700);
}
