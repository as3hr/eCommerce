import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/custom_tile.dart';
import '../order_detail/order_detail.dart';
import 'package:flutter/material.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomTile(
            height: 65,
            leading: const Image(image: AssetImage(AppImages.order)),
            title: Text(
              'This is just for testing the UI',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 16, color: AppColors.pureBlack),
            ),
            subTitle: Text('4 items',
                style: AppDecoration.lightStyle(
                    fontSize: 13, color: AppColors.pureBlack)),
            trailing: const Image(
              image: AssetImage(AppImages.arrowForward),
              color: AppColors.pureBlack,
            ),
            trailingOnTap: () {
              changePage(OrderDetail.routeName);
            },
          );
        });
  }
}
