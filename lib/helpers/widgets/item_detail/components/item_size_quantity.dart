import 'package:e_commerce/models/product.dart';
import 'package:get/get.dart';

import '../../../../screens/home/components/cart/cart_controller.dart';
import '../../../functions/bottom_sheet.dart';
import '../../bottom_sheet/custom_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/app_decoration.dart';
import '../../../styles/app_images.dart';
import '../../bottom_sheet/sheet.dart';
import '../../custom_tile.dart';

class ItemSizeQuantity extends StatelessWidget {
  const ItemSizeQuantity(
      {super.key, required this.product, required this.changable});
  final Product product;
  final bool changable;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      product.quantity = product.quantity == 0 ? 1 : product.quantity;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                viewBottomSheet(
                  context,
                  'Size',
                  CustomBottomSheetBody(containers: [
                    Sheet(title: 'S', index: 0),
                    Sheet(title: 'M', index: 1),
                    Sheet(title: 'L', index: 2),
                    Sheet(title: 'XL', index: 3),
                    Sheet(title: '2XL', index: 4),
                  ]),
                  () {},
                );
              },
              child: CustomTile(
                borderRadius: 20,
                width: 1.sw,
                leading: Text(
                  'Size',
                  style: AppDecoration.semiBoldStyle(
                      fontSize: 19, color: AppColors.lightBlack),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'S',
                      style: AppDecoration.boldStyle(
                          fontSize: 17, color: AppColors.pureBlack),
                    ),
                    20.horizontalSpace,
                    const Image(image: AssetImage(AppImages.arrowDropDown))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: CustomTile(
              borderRadius: 20,
              width: 1.sw,
              leading: Text(
                'Quantity',
                style: AppDecoration.semiBoldStyle(
                    fontSize: 19, color: AppColors.lightBlack),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (changable) {
                        controller.increaseQuantity(product);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightPurple,
                      child: Center(
                          child: Text(
                        '+',
                        style: AppDecoration.mediumStyle(
                            fontSize: 19, color: AppColors.pureWhite),
                      )),
                    ),
                  ),
                  15.horizontalSpace,
                  Text(
                    '${product.quantity}',
                    style: AppDecoration.boldStyle(
                        fontSize: 17, color: AppColors.pureBlack),
                  ),
                  15.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      if (changable) {
                        controller.decreaseQuantity(product);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightPurple,
                      child: Center(
                          child: Text(
                        "−",
                        style: AppDecoration.mediumStyle(
                            fontSize: 19, color: AppColors.pureWhite),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
