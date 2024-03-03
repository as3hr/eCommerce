import '../styles/app_colors.dart';
import '../styles/app_decoration.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.preFilledValue,
    this.isObsecure = false,
    this.hintText,
    this.width,
    this.validator,
    required this.onChanged,
  });
  final String? preFilledValue;
  final bool isObsecure;
  final String? hintText;
  final double? width;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      child: Container(
        width: width,
        color: Colors.grey.shade100,
        child: TextFormField(
            initialValue: preFilledValue,
            obscureText: isObsecure,
            cursorColor: AppColors.lightPurple,
            onChanged: onChanged,
            validator: validator,
            decoration: AppDecoration.inputFieldDecoration(hintText ?? '')),
      ),
    );
  }
}
