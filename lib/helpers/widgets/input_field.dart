import 'package:flutter/services.dart';

import '../styles/app_colors.dart';
import '../styles/app_decoration.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.preFilledValue,
    this.isObsecure = false,
    this.hintText,
    this.width,
    this.validator,
    this.readOnly = false,
    this.inputFormatters,
    this.onSubmit,
    required this.onChanged,
  });
  final List<TextInputFormatter>? inputFormatters;
  final String? preFilledValue;
  final bool isObsecure;
  final bool readOnly;
  final String? hintText;
  final double? width;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final void Function(String)? onSubmit;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      child: Container(
        width: widget.width,
        color: Colors.grey.shade100,
        child: TextFormField(
            controller: controller,
            inputFormatters: widget.inputFormatters,
            initialValue: widget.preFilledValue,
            obscureText: widget.isObsecure,
            readOnly: widget.readOnly,
            cursorColor: AppColors.lightPurple,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onFieldSubmitted: widget.onSubmit,
            decoration:
                AppDecoration.inputFieldDecoration(widget.hintText ?? '')),
      ),
    );
  }
}
