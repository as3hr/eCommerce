import 'package:flutter/material.dart';

class ListingCell {
  final Widget? child;
  final Alignment alignment;
  bool showEditIcon;
  ListingCell({
    this.showEditIcon = false,
    this.child,
    this.alignment = Alignment.center,
  });
}
