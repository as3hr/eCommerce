import 'package:e_commerce/models/order.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
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
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        collapsedBackgroundColor: Theme.of(context).colorScheme.onPrimary,
        expansionAnimationStyle: AnimationStyle(curve: Curves.easeIn),
        leading: Image(
          image: const AssetImage(AppImages.order),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        title: Text(
          '${order.products?.length} items',
          style: AppDecoration.mediumStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSecondary),
        ),
        trailing: Text(
          'View all',
          style: AppDecoration.mediumStyle(
              fontSize: 12, color: AppColors.lightPurple),
        ),
        children: order.products?.map((product) {
              return ListTile(
                title: Text(
                  '${product.title}',
                  style: AppDecoration.boldStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                subtitle: Text(
                  '\$${product.price}',
                  style: AppDecoration.mediumStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                trailing: GestureDetector(
                  onTap: () =>
                      changePage(ItemDetailScreen.routeName, arguments: {
                    'product': product,
                    'changable': false,
                  }),
                  child: Image(
                    image: const AssetImage(AppImages.arrowForward),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              );
            }).toList() ??
            [],
      )),
    );
  }
}
