import 'package:e_commerce/models/order.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/custom_tile.dart';
import '../../../../helpers/widgets/item_detail/item_detail_screen.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
          child: ExpansionTile(
        shape: const Border(),
        backgroundColor: AppColors.grayI,
        collapsedBackgroundColor: AppColors.grayI,
        expansionAnimationStyle: AnimationStyle(curve: Curves.easeIn),
        leading: const Image(
          image: AssetImage(AppImages.order),
          color: AppColors.pureBlack,
        ),
        title: Text(
          '${order.products?.length} items',
          style: AppDecoration.mediumStyle(
              fontSize: 15, color: AppColors.pureBlack),
        ),
        trailing: Text(
          'View all',
          style: AppDecoration.mediumStyle(
              fontSize: 12, color: AppColors.lightPurple),
        ),
        children: order.products?.map((product) {
              return CustomTile(
                title: Text(
                  '${product.title}',
                  style: AppDecoration.boldStyle(
                      fontSize: 15, color: AppColors.pureBlack),
                ),
                subTitle: Text(
                  '${product.price}',
                  style: AppDecoration.mediumStyle(
                      fontSize: 15, color: AppColors.pureBlack),
                ),
                trailing: GestureDetector(
                  onTap: () =>
                      changePage(ItemDetailScreen.routeName, arguments: {
                    'product': product,
                  }),
                  child: const Image(image: AssetImage(AppImages.arrowForward)),
                ),
              );
            }).toList() ??
            [],
      )),
    );
  }
}
