import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';

class SalesRevenueGraph extends StatelessWidget {
  const SalesRevenueGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sales Revenue',
            style:
                AppDecoration.boldStyle(fontSize: 18, color: AppColors.black)),
        10.verticalSpace,
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          surfaceTintColor: AppColors.white,
          color: AppColors.grayBackground,
          child: Container(
            height: 0.4.sh,
          ),
        ),
      ],
    );
  }
}
