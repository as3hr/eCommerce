import 'package:ecommerce_admin_panel/screens/home_screen/components/sales_revenue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';
import '../../../helpers/styles/asset_images.dart';
import 'stats_box.dart';

class MainAnalytics extends StatelessWidget {
  const MainAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.6.sw,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Statistics',
                style: AppDecoration.boldStyle(
                    fontSize: 18, color: AppColors.black)),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatsBox(
                  color: Colors.pink.shade200,
                  leadingImage: AssetImages.order,
                  leadingImageColor: Colors.pink.shade400,
                  subTitle: '152k',
                  title: 'Sales',
                ),
                10.horizontalSpace,
                StatsBox(
                  color: Colors.orange.shade200,
                  leadingImage: AssetImages.users,
                  leadingImageColor: Colors.orange.shade400,
                  subTitle: '99.7k',
                  title: 'Cost',
                ),
                10.horizontalSpace,
                StatsBox(
                  color: Colors.green.shade100,
                  leadingImage: AssetImages.product,
                  leadingImageColor: Colors.green,
                  subTitle: '32.1k',
                  title: 'Profit',
                ),
              ],
            ),
            10.verticalSpace,
            const SalesRevenueGraph(),
          ],
        ),
      ),
    );
  }
}
