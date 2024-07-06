import 'package:e_commerce/helpers/widgets/item_detail/components/item_detail_content.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../styles/app_decoration.dart';
import '../../styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../back_button.dart';
import 'components/photo_slider.dart';

class ItemDetailScreen extends StatefulWidget {
  static const routeName = '/item-detail';
  const ItemDetailScreen({
    super.key,
    required this.product,
    this.changable = true,
  });
  final bool changable;
  final Product product;

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  final pageController = PageController();
  bool showPageView = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      final profileController = Get.find<ProfileScreenController>();
      widget.product.isFav = profileController.favourites.products
              ?.any((element) => element.title == widget.product.title) ==
          true;
      return GestureDetector(
        onTap: () {
          showPageView = false;
          controller.update();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
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
                        if (!widget.changable) ...[
                          const Spacer(),
                          Text(
                            'You cannot update this product anymore!',
                            style: AppDecoration.mediumStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                        ],
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (widget.changable) {
                              profileController.toggleFav(widget.product);
                              controller.update();
                            }
                          },
                          child: widget.product.isFav && widget.changable
                              ? Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).colorScheme.error,
                                  size: 20,
                                )
                              : Image(
                                  image: const AssetImage(
                                      AppImages.favIconUnfilled),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ),
                        20.horizontalSpace
                      ],
                    ),
                    ItemDetailContent(
                      product: widget.product,
                      changable: widget.changable,
                      onTap: () {
                        showPageView = true;
                        controller.update();
                      },
                    )
                  ],
                ),
                if (showPageView)
                  Positioned(
                      top: 10,
                      right: 10,
                      bottom: 10,
                      left: 10,
                      child: PhotoSlider(
                        images: widget.product.images,
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
