import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../functions/change_page.dart';
import '../styles/app_decoration.dart';
import '../styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import 'item_detail/item_detail_screen.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.product,
    this.width,
  });
  final double? width;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          changePage(ItemDetailScreen.routeName,
              arguments: {'product': product});
        },
        child: Container(
          height: 024.sh,
          width: width ?? 0.4.sw,
          decoration: BoxDecoration(
            color: AppColors.grayI,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              if (product.images.isNotEmpty)
                Center(
                  child: CachedNetworkImage(
                    imageUrl: product.images.firstOrNull ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              Positioned(
                top: 10,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    product.isFav = !product.isFav;
                    controller.update();
                  },
                  child: product.isFav
                      ? const Icon(
                          Icons.favorite,
                          color: AppColors.redColor,
                          size: 20,
                        )
                      : const Image(
                          image: AssetImage(AppImages.favIconUnfilled)),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 55,
                    width: width ?? 0.4.sw,
                    decoration: const BoxDecoration(
                      color: AppColors.grayIII,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title ?? '',
                            style: AppDecoration.semiMediumStyle(
                                fontSize: 17.5, color: AppColors.pureBlack),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${product.price}',
                            style: AppDecoration.boldStyle(
                                fontSize: 16, color: AppColors.pureBlack),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
