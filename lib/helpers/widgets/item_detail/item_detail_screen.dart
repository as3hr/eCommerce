import 'package:e_commerce/helpers/widgets/item_detail/components/item_detail_content.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_decoration.dart';
import '../../styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../back_button.dart';
import 'components/photo_slider.dart';

class ItemDetailScreen extends StatelessWidget {
  static const routeName = '/item-detail';
  const ItemDetailScreen(
      {super.key, required this.product, this.changable = true});
  final bool changable;
  final Product product;

  static final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.showPageView = false;
          controller.update();
        },
        child: Scaffold(
          backgroundColor: AppColors.pureWhite,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Row(
                      children: [
                        20.horizontalSpace,
                        const CustomBackButton(),
                        if (!changable) ...[
                          const Spacer(),
                          Text(
                            'You cannot update this product anymore!',
                            style: AppDecoration.mediumStyle(
                                fontSize: 14, color: AppColors.pureBlack),
                          ),
                        ],
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (changable) {
                              product.isFav = !product.isFav;
                              controller.update();
                            }
                          },
                          child: product.isFav && changable
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColors.redColor,
                                  size: 20,
                                )
                              : const Image(
                                  image: AssetImage(AppImages.favIconUnfilled)),
                        ),
                        20.horizontalSpace
                      ],
                    ),
                    ItemDetailContent(product: product, changable: changable)
                  ],
                ),
                if (controller.showPageView)
                  Positioned(
                      top: 10,
                      right: 10,
                      bottom: 10,
                      left: 10,
                      child: PhotoSlider(
                        images: product.images,
                        pageController: pageController,
                      )),
              ],
            ),
          )),
        ),
      );
    });
  }
}
