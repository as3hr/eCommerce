import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    super.key,
    this.onChanged,
    this.title,
    this.hintText,
    this.suffixIcon,
    this.width,
    this.height,
    this.isMultiLineField = false,
    this.readOnly = false,
    this.preFilledValue,
  });
  final double? height;
  final double? width;
  final String? title;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isMultiLineField;
  final bool readOnly;
  final Function(String)? onChanged;
  final String? preFilledValue;
  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.preFilledValue ?? '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMultiLineField
        ? Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
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
                      width: widget.width ?? 0.5.sw,
                      height: widget.height ?? 0.3.sh,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: Theme.of(context).textTheme.bodyMedium,
                        readOnly: widget.readOnly,
                        controller: controller,
                        onChanged: widget.onChanged,
                        decoration: fieldDecoration(
                          label: widget.title,
                          hintText: widget.hintText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Align(
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
                      height: 38,
                      width: widget.width ?? 0.5.sw,
                      child: TextFormField(
                        scrollPadding: const EdgeInsets.all(0),
                        maxLines: widget.isMultiLineField ? null : 1,
                        style: Theme.of(context).textTheme.bodyMedium,
                        readOnly: widget.readOnly,
                        controller: controller,
                        onChanged: widget.onChanged,
                        decoration: fieldDecoration(
                          label: widget.title,
                          hintText: widget.hintText,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                  ],
                ),
              ),
            ),
          );
  }
}
