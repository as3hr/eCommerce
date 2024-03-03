import 'package:e_commerce/models/product.dart';

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
    return GestureDetector(
      onTap: () {
        changePage(ItemDetailScreen.routeName, arguments: {'product': product});
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
            const Center(child: Text('I M A G E  H E R E')
                // Image(
                //   image: AssetImage(AppImages.bellImage),
                //   fit: BoxFit.fitHeight,
                // ),
                ),
            Positioned(
              top: 10,
              right: 5,
              child: product.isFav
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.redColor,
                    )
                  : const Image(
                      image: AssetImage(AppImages.favIconUnfilled),
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
  }
}
