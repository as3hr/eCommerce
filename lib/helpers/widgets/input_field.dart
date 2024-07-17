import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/app_colors.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.preFilledValue,
    this.passwordField = false,
    this.hintText,
    this.width,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.inputFormatters,
    this.onSubmit,
    this.maxLength,
    this.suffixIcon,
    this.preFixIcon,
    required this.onChanged,
  });
  final List<TextInputFormatter>? inputFormatters;
  final String? preFilledValue;
  final bool passwordField;
  final int? maxLength;
  final bool readOnly;
  final String? hintText;
  final double? width;
  final Widget? preFixIcon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final void Function(String)? onSubmit;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final controller = TextEditingController();
  bool isObsecure = true;

  @override
  void initState() {
    super.initState();
    if (widget.preFilledValue != null) {
      controller.text = '${widget.preFilledValue}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
            color: AppColors.grayBackground,
            borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: controller,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.passwordField ? isObsecure : false,
            readOnly: widget.readOnly,
            cursorColor: AppColors.navy,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onFieldSubmitted: widget.onSubmit,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(3),
              prefixIcon: widget.preFixIcon,
              hintText: widget.hintText ?? '',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: AppColors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: AppColors.transparent),
              ),
              suffixIcon: widget.passwordField
                  ? InkWell(
                      onTap: () {
                        isObsecure = !isObsecure;
                        setState(() {});
                      },
                      child: Icon(
                        isObsecure
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_rounded,
                        color: AppColors.navy,
                      ))
                  : null,
            )),
      ),
    );
  }
}
