import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:get/get.dart';

import '../../../helpers/widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key, this.reverse = false});
  final bool reverse;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      List<Product> products = controller.productsList;
      if (reverse) {
        products = products.reversed.toList();
      }
      return SizedBox(
        height: 280,
        width: 1.sw,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: ((context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemContainer(
                  width: 0.5.sw,
                  product: product,
                ),
              );
            })),
      );
    });
  }
}
