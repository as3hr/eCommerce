import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/bottom_sheet.dart';
import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/widgets/modal_drop_down.dart';
import '../../../../helpers/widgets/custom_bottom_sheet_body.dart';
import '../cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/widgets/bottom_sheet/bottom_sheet_container.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.grayI,
            ),
          ),
          ModalDropDown(
            text: 'Men',
            onTap: () {
              viewBottomSheet(
                context,
                'Gender',
                const CustomBottomSheetBody(
                  containers: [
                    BottomSheetContainer(
                      index: 0,
                      title: 'Men',
                    ),
                    BottomSheetContainer(
                      index: 1,
                      title: 'Women',
                    ),
                    BottomSheetContainer(
                      index: 2,
                      title: 'Kids',
                    ),
                  ],
                ),
              );
            },
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: GestureDetector(
                  onTap: () {
                    changePage(CartScreen.routeName);
                  },
                  child: const CircleAvatar(
                      backgroundColor: AppColors.lightPurple,
                      radius: 18,
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 17,
                        color: AppColors.pureWhite,
                      )),
                ),
              ),
              if (controller.checkoutProducts.isNotEmpty)
                Positioned(
                    top: 0,
                    right: 20,
                    bottom: 20,
                    child: CircleAvatar(
                        backgroundColor: AppColors.redColor,
                        radius: 10,
                        child: Center(
                          child: Text(
                            '${controller.checkoutProducts.length}',
                            style: AppDecoration.mediumStyle(
                                fontSize: 10, color: AppColors.pureWhite),
                          ),
                        ))),
            ],
          ),
        ],
      );
    });
  }
}
