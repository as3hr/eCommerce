import 'package:flutter/material.dart';

import '../../theme.dart';
import '../styles/app_colors.dart';

class CheckBoxField extends StatefulWidget {
  const CheckBoxField({
    super.key,
    required this.title,
    required this.onChanged,
    required this.isChecked,
  });
  final bool isChecked;
  final String title;
  final Function(bool?)? onChanged;

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 15,
            bottom: 8,
          ),
          child: Text(
            widget.title,
            style: smallTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: widget.isChecked ? Colors.blue : Colors.transparent,
              border: Border.all(
                color: widget.isChecked ? Colors.white : AppColors.smokyBlack,
                width: 0,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Checkbox(
              side: const BorderSide(
                color: Colors.transparent,
              ),
              shape: checkBoxShape,
              value: widget.isChecked,
              onChanged: (val) {
                setState(() {
                  widget.onChanged?.call(val);
                });
              },
              activeColor: Colors.blue,
              checkColor: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
