import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class PageControlButton extends StatelessWidget {
  const PageControlButton({super.key, required this.icon, required this.onTap});
  final void Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.skyBlue,
              width: 0.5,
            )),
        child: Center(
            child: Icon(
          icon,
          color: AppColors.skyBlue,
          size: 25,
        )),
      ),
    );
  }
}
