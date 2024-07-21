import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/helpers/widgets/shimmer_effect.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

import '../../../functions/loader.dart';
import '../../../styles/app_colors.dart';
import '../../../styles/app_decoration.dart';
import '../../../styles/app_images.dart';
import '../../custom_tile.dart';
import 'item_size_quantity.dart';

class ItemDetailContent extends StatelessWidget {
  const ItemDetailContent(
      {super.key,
      required this.product,
      required this.changable,
      required this.onTap});
  final Product product;
  final void Function() onTap;
  final bool changable;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 0.45.sh,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    final image = product.images[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                            height: 0.45.sh,
                            width: 0.55.sw,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            child: Center(
                              child: CachedNetworkImage(
                                imageUrl: image,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.onPrimary,
                                        BlendMode.dst,
                                      ),
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const ShimmerEffect(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            )),
                      ),
                    );
                  })),
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              product.title ?? '',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onSecondary),
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
            changable: changable,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              product.description ?? '',
              style: AppDecoration.lightStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Shipping & Returns",
              style: AppDecoration.semiBoldStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Free standard shipping and free 60-day returns",
              style: AppDecoration.lightStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '${product.rating?.toDouble()}',
              style: AppDecoration.boldStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                if (changable) {
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
                  controller.update();
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
      );
    });
  }
}
