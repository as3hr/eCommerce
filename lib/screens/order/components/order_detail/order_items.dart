import 'package:e_commerce/helpers/widgets/items_expansion.dart';
import 'package:e_commerce/models/order.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/item_detail/item_detail_screen.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return ItemsExpansion(
      leading: Image(
        image: const AssetImage(AppImages.order),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      titleText: '${order.products?.length} items',
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
                onTap: () => changePage(ItemDetailScreen.routeName, arguments: {
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
    );
  }
}
