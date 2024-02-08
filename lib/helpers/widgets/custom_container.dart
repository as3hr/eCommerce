import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.onTap,
    required this.text,
    this.preFixImage,
    this.width,
    this.height,
    this.fontSize,
    required this.color,
    required this.textColor,
  });
  final String? preFixImage;
  final String text;
  final Function() onTap;
  final Color color;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
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
              if (preFixImage != null)
                Positioned(
                  top: 10,
                  bottom: 10,
                  left: 25,
                  child: Image(
                    image: AssetImage(preFixImage!),
                  ),
                ),
              Center(
                child: Text(
                  text,
                  style: AppDecoration.semiBoldStyle(
                      fontSize: fontSize ?? 20, color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
