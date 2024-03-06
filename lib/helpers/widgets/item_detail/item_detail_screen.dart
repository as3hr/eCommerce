import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_decoration.dart';
import '../../styles/app_images.dart';
import '../custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../back_button.dart';
import 'components/item_size_quantity.dart';

class ItemDetailScreen extends StatelessWidget {
  static const routeName = '/item-detail';
  const ItemDetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.pureWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    20.horizontalSpace,
                    const CustomBackButton(),
                    const Spacer(),
                    product.isFav
                        ? const Icon(Icons.favorite)
                        : const Image(
                            image: AssetImage(AppImages.favIconUnfilled)),
                    20.horizontalSpace
                  ],
                ),
                20.verticalSpace,
                SizedBox(
                    height: 0.45.sh,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 0.45.sh,
                                width: 0.55.sw,
                                decoration: const BoxDecoration(
                                  color: AppColors.grayI,
                                ),
                                child: const Center(
                                    child: Text('I M A G E  H E R E'))),
                          );
                        })),
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    product.title ?? '',
                    style: AppDecoration.semiBoldStyle(
                        fontSize: 17, color: AppColors.pureBlack),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "\$${product.price}",
                    style: AppDecoration.semiBoldStyle(
                        fontSize: 17, color: AppColors.lightPurple),
                  ),
                ),
                20.verticalSpace,
                ItemSizeQuantity(
                  product: product,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    product.description ?? '',
                    style: AppDecoration.lightStyle(
                        fontSize: 14, color: AppColors.lightBlack),
                  ),
                ),
                15.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Shipping & Returns",
                    style: AppDecoration.semiBoldStyle(
                        fontSize: 17, color: AppColors.pureBlack),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Free standard shipping and free 60-day returns",
                    style: AppDecoration.lightStyle(
                        fontSize: 14, color: AppColors.pureBlack),
                  ),
                ),
                15.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '${product.rating?.toDouble()}',
                    style: AppDecoration.boldStyle(
                        fontSize: 25, color: AppColors.pureBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      final resp = controller.addProduct(product);
                      if (resp) {
                        showToast(
                            message: 'Added Successfully',
                            imagePath: AppImages.successful);
                      } else {
                        showToast(
                            message: 'Cannot add this product anymore!',
                            imagePath: AppImages.unsuccessful);
                      }
                    },
                    child: CustomTile(
                      width: 1.sw,
                      borderRadius: 30,
                      color: AppColors.lightPurple,
                      leading: Text(
                        '\$${product.price}',
                        style: AppDecoration.semiBoldStyle(
                            fontSize: 17, color: AppColors.pureWhite),
                      ),
                      trailing: Text(
                        'Add to Bag',
                        style: AppDecoration.semiMediumStyle(
                            fontSize: 17, color: AppColors.pureWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
