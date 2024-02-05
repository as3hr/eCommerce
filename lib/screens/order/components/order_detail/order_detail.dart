import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_detail_container.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_status_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/widgets/back_button.dart';

class OrderDetail extends StatelessWidget {
  static const routeName = '/order-detail';
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            35.verticalSpace,
            Row(
              children: [
                20.horizontalSpace,
                const CustomBackButton(),
                90.horizontalSpace,
                const Center(
                  child: Text('Order #34521'),
                ),
              ],
            ),
            const OrderStatusList(),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Order Items'),
            ),
            15.verticalSpace,
            const OrderDetailContainer(
                child: Center(
              child: ListTile(
                leading: Image(image: AssetImage(AppImages.order)),
                title: Text('4 items'),
                trailing: Text('View all'),
              ),
            )),
            20.verticalSpace,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Shipping Details'),
            ),
            15.verticalSpace,
            const OrderDetailContainer(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Jail Chowrangi near Aligarh Collegiate, Building: Saima Apartments, flat #109, Block B, postal code: 74555'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
