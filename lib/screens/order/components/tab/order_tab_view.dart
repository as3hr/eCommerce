import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/helpers/widgets/custom_tile.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_detail.dart';
import 'package:flutter/material.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomTile(
            leading: const Image(image: AssetImage(AppImages.order)),
            title: const Text('This is just for testing the UI'),
            subTitle: const Text('4 items'),
            trailing: const Image(image: AssetImage(AppImages.arrowForward)),
            trailingOnTap: () {
              changePage(OrderDetail.routeName);
            },
          );
        });
  }
}
