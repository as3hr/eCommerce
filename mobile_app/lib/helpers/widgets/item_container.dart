import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/widgets/shimmer_effect.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../functions/change_page.dart';
import '../styles/app_decoration.dart';
import '../styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      final profileController = Get.find<ProfileScreenController>();
      product.isFav = profileController.favourites.products
              ?.any((element) => element.title == product.title) ==
          true;
      return GestureDetector(
        onTap: () {
          if (product.images.isNotEmpty) {
            changePage(ItemDetailScreen.routeName,
                arguments: {'product': product});
          } else {
            showToast(
              duration: const Duration(seconds: 2),
              message: 'This Product is not in the Stock right now!',
              imagePath: AppImages.access,
            );
          }
        },
        child: Container(
          height: 024.sh,
          width: width ?? 0.4.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              if (product.images.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                      placeholder: (context, url) => const ShimmerEffect(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              if (product.images.isEmpty)
                Center(
                  child: Icon(Icons.image),
                ),
              Positioned(
                top: 10,
                right: 5,
                child: GestureDetector(
                  onTap: () {
                    profileController.toggleFav(product);
                    controller.update();
                  },
                  child: product.isFav
                      ? Icon(
                          Icons.favorite,
                          color: Theme.of(context).colorScheme.error,
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: const BorderRadius.only(
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
                                fontSize: 17.5,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${product.price}',
                            style: AppDecoration.boldStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
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
