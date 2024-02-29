import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/header.dart';
import 'order_detail_container.dart';
import 'order_status_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            const Header(text: 'Order #34521'),
            const OrderStatusList(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Order Items',
                style: AppDecoration.boldStyle(
                    fontSize: 17, color: AppColors.pureBlack),
              ),
            ),
            15.verticalSpace,
            OrderDetailContainer(
                child: Center(
              child: ListTile(
                leading: const Image(
                  image: AssetImage(AppImages.order),
                  color: AppColors.pureBlack,
                ),
                title: Text(
                  '4 items',
                  style: AppDecoration.mediumStyle(
                      fontSize: 15, color: AppColors.pureBlack),
                ),
                trailing: Text(
                  'View all',
                  style: AppDecoration.mediumStyle(
                      fontSize: 12, color: AppColors.lightPurple),
                ),
              ),
            )),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Shipping Details',
                style: AppDecoration.boldStyle(
                    fontSize: 17, color: AppColors.pureBlack),
              ),
            ),
            15.verticalSpace,
            OrderDetailContainer(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Jail Chowrangi near Aligarh Collegiate, Building: Saima Apartments, flat #109, Block B, postal code: 74555',
                  style: AppDecoration.boldStyle(
                      fontSize: 13, color: AppColors.lightBlack),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
