import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/wishlist.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/widgets/item_container.dart';

class WishListCollectionScreen extends StatelessWidget {
  static const routeName = '/wishlist-collection';
  const WishListCollectionScreen({super.key, required this.wish});
  final Wish wish;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.pureWhite,
        body: SafeArea(
            child: Column(
          children: [
            35.verticalSpace,
            Header(text: wish.title ?? ''),
            35.verticalSpace,
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: wish.products?.length,
                    itemBuilder: (context, index) {
                      final product = wish.products?[index] ?? Product();
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ItemContainer(
                          width: 0.463.sw,
                          product: product,
                        ),
                      );
                    }))
          ],
        )),
      );
    });
  }
}
