import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme.dart';

class BaseNumberField extends StatefulWidget {
  const BaseNumberField({
    Key? key,
    required this.title,
    this.hintText,
    this.preFilledNumber,
    this.width,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);
  final bool readOnly;
  final String title;
  final double? width;
  final double? preFilledNumber;
  final String? hintText;
  final void Function(String?)? onChanged;

  @override
  State<BaseNumberField> createState() => _BaseNumberFieldState();
}

class _BaseNumberFieldState extends State<BaseNumberField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '${widget.preFilledNumber ?? ''}');
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              8.verticalSpace,
              SizedBox(
                height: 60,
                width: widget.width ?? 0.5.sw,
                child: TextFormField(
                  readOnly: widget.readOnly,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: fieldDecoration(
                    label: widget.title,
                    hintText: widget.hintText,
                  ),
                  controller: controller,
                  onChanged: (val) {
                    widget.onChanged?.call(val);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
