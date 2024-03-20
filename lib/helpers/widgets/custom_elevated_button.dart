import 'package:flutter/material.dart';

import '../extensions/theme_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.textColor,
    required this.onPressed,
    required this.text,
    this.showCheck = false,
  });
  final Color? textColor;
  final String text;
  final bool showCheck;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(
                color: ThemeColors.grayII,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? ThemeColors.smokyBlack,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
