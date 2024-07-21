import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/styles/app_colors.dart';

class StatsBox extends StatelessWidget {
  const StatsBox({
    super.key,
    required this.color,
    required this.leadingImage,
    required this.leadingImageColor,
    required this.subTitle,
    required this.title,
  });
  final Color color;
  final String leadingImage;
  final Color leadingImageColor;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 0.12.sw,
      padding: const EdgeInsets.only(left: 40),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: ListTile(
        leading: Image.asset(
          leadingImage,
          color: leadingImageColor,
        ),
        title: Text(
          title.capitalizeFirst!,
          style:
              AppDecoration.lightStyle(fontSize: 12, color: AppColors.grayVI),
        ),
        subtitle: Text(
          '\$$subTitle',
          style: AppDecoration.boldStyle(fontSize: 18, color: AppColors.black),
        ),
      )),
    );
  }
}
