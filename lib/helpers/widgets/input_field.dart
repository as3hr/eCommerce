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
    required this.onChanged,
  });
  final String? preFilledValue;
  final bool isObsecure;
  final String? hintText;
  final double? width;
  final void Function(String) onChanged;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final controller = TextEditingController();

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
        color: Colors.grey.shade100,
        child: TextFormField(
            controller: controller,
            obscureText: widget.isObsecure,
            cursorColor: AppColors.lightPurple,
            onChanged: widget.onChanged,
            decoration:
                AppDecoration.inputFieldDecoration(widget.hintText ?? '')),
      ),
    );
  }
}
