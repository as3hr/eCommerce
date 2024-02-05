import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 0.2.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grayI,
      ),
      child: Center(child: Text(status)),
    );
  }
}
