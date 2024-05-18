import 'package:flutter/services.dart';

import '../styles/app_colors.dart';
import '../styles/app_decoration.dart';
import 'package:flutter/material.dart';

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
    required this.onChanged,
  });
  final List<TextInputFormatter>? inputFormatters;
  final String? preFilledValue;
  final bool passwordField;
  final int? maxLength;
  final bool readOnly;
  final String? hintText;
  final double? width;
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
        color: Theme.of(context).colorScheme.onPrimary,
        child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: controller,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.passwordField ? isObsecure : false,
            readOnly: widget.readOnly,
            cursorColor: AppColors.lightPurple,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onFieldSubmitted: widget.onSubmit,
            decoration: AppDecoration.inputFieldDecoration(
              widget.hintText ?? '',
              context,
              suffixIcon: widget.passwordField
                  ? GestureDetector(
                      onTap: () {
                        isObsecure = !isObsecure;
                        setState(() {});
                      },
                      child: Icon(
                        isObsecure
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_rounded,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ))
                  : null,
            )),
      ),
    );
  }
}
