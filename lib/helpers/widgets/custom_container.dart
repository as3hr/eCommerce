import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.onTap,
    required this.text,
    this.preFixIcon,
    this.width,
    this.height,
    required this.color,
    required this.textColor,
  });
  final IconData? preFixIcon;
  final String text;
  final Function() onTap;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 75,
          width: width ?? 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: color,
          ),
          child: Stack(
            children: [
              if (preFixIcon != null)
                Positioned(
                  top: 10,
                  bottom: 10,
                  left: 25,
                  child: Icon(
                    preFixIcon,
                    size: 25,
                  ),
                ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
