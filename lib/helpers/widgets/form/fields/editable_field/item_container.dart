import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer(
      {super.key,
      required this.onTap,
      required this.text,
      required this.borderColor,
      required this.textColor,
      required this.icon});
  final void Function() onTap;
  final String text;
  final Color borderColor;
  final Color textColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 0.08.sw,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          border: Border.all(color: borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Icon(
                icon,
                color: textColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
