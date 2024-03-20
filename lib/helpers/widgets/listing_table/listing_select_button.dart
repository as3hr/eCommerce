import 'package:flutter/material.dart';

class ListingSelectButton {
  final String? label;
  final Widget? icon;
  final void Function(List<int>)? action;

  ListingSelectButton({
    this.label,
    this.icon,
    this.action,
  });
}
