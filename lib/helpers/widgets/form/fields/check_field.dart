// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../../../../theme.dart';
import '../../check_box_field.dart';

class CheckField extends StatefulWidget {
  bool isChecked;
  final void Function(bool?)? onChanged;
  final bool preFilledValue;
  final String? title;
  final double? width;
  CheckField({
    super.key,
    this.width,
    this.title,
    required this.onChanged,
    this.preFilledValue = false,
    this.isChecked = false,
  });
  @override
  State<CheckField> createState() => _CheckFieldState();
}

class _CheckFieldState extends State<CheckField> {
  @override
  void initState() {
    super.initState();
    widget.isChecked = widget.preFilledValue;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 48,
          width: widget.width,
          decoration: boxDecoration,
          child: CheckBoxField(
            title: widget.title.toString(),
            onChanged: widget.onChanged,
            isChecked: widget.isChecked,
          ),
        ),
      ),
    );
  }
}
