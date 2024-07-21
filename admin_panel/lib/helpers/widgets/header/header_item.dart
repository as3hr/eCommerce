import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({super.key, required this.text, this.showIcon = false});
  final String text;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: largeTextStyle,
        ),
        const SizedBox(
          width: 10,
        ),
        if (showIcon)
          const Text(
            '•',
            style: TextStyle(fontSize: 20, color: AppColors.black),
          ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
