import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.textColor,
    this.icon,
    this.color,
    this.borderColor,
    this.width,
    this.height,
    required this.onPressed,
    required this.text,
    this.showCheck = false,
  });
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final String text;
  final bool showCheck;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: height ?? 40,
        width: width ?? 100,
        decoration: BoxDecoration(
            border:
                Border.all(color: borderColor ?? AppColors.grayII, width: 0.15),
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: textColor,
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? AppColors.smokyBlack,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
