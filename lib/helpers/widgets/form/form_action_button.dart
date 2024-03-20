import 'package:flutter/material.dart';

class FormActionButton {
  final Future Function() onTap;
  final String title;
  final String toolTipText;
  final Color textColor;
  final bool showCheck;
  FormActionButton({
    this.showCheck = false,
    required this.textColor,
    required this.onTap,
    required this.title,
    required this.toolTipText,
  });
}
