import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key, required this.text, this.height, this.width});
  final String text;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 25,
      width: width ?? 0.23.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.isDark ? AppColors.lightIndigo : AppColors.grayI,
      ),
      child: Center(
          child: Text(
        text,
      )),
    );
  }
}
