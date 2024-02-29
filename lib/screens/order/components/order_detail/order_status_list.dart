import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusList extends StatelessWidget {
  const OrderStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        ListTile(
          leading: const Icon(
            Icons.check_circle,
            color: AppColors.lightPurple,
          ),
          title: Text(
            'Delivered',
            style: AppDecoration.mediumStyle(
                fontSize: 18, color: AppColors.pureBlack),
          ),
          trailing: Text('28 May',
              style: AppDecoration.mediumStyle(
                  fontSize: 15, color: AppColors.pureBlack)),
        ),
        8.verticalSpace,
        ListTile(
          leading: const Icon(
            Icons.check_circle,
            color: AppColors.lightPurple,
          ),
          title: Text('Shipped',
              style: AppDecoration.mediumStyle(
                  fontSize: 18, color: AppColors.pureBlack)),
          trailing: Text('28 May',
              style: AppDecoration.mediumStyle(
                  fontSize: 15, color: AppColors.pureBlack)),
        ),
        8.verticalSpace,
        ListTile(
          leading: const Icon(
            Icons.check_circle,
            color: AppColors.lightPurple,
          ),
          title: Text('Order Confirmed',
              style: AppDecoration.mediumStyle(
                  fontSize: 18, color: AppColors.pureBlack)),
          trailing: Text('28 May',
              style: AppDecoration.mediumStyle(
                  fontSize: 15, color: AppColors.pureBlack)),
        ),
        8.verticalSpace,
        ListTile(
          leading: const Icon(
            Icons.check_circle,
            color: AppColors.lightPurple,
          ),
          title: Text('Order Placed',
              style: AppDecoration.mediumStyle(
                  fontSize: 18, color: AppColors.pureBlack)),
          trailing: Text('28 May',
              style: AppDecoration.mediumStyle(
                  fontSize: 15, color: AppColors.pureBlack)),
        ),
        20.verticalSpace,
      ],
    );
  }
}
