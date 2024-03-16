import 'dart:io';

import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/bottom_sheet.dart';
import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/widgets/modal_drop_down.dart';
import '../../../../helpers/widgets/custom_bottom_sheet_body.dart';
import '../../../../helpers/widgets/rounded_image.dart';
import '../../../auth/auth_controller.dart';
import '../cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/widgets/bottom_sheet/bottom_sheet_container.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String gender = 'Men';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      final authController = Get.find<AuthController>();
      final homeController = Get.find<HomeScreenController>();
      final name = authController.user.firstName;
      final image = authController.image;
      final isSocial = authController.user.isSocial;
      final isEmptyImage = image.isEmpty == true;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: (isSocial && !isEmptyImage)
                ? RoundedImage(
                    imageUrl: image,
                    iconText: name,
                    radius: 30.w,
                  )
                : (!isEmptyImage)
                    ? RoundedImage(
                        file: File(image),
                        iconText: name,
                        radius: 30.w,
                      )
                    : RoundedImage(
                        iconText: name,
                        radius: 30.w,
                      ),
          ),
          ModalDropDown(
            text: gender,
            onTap: () {
              viewBottomSheet(
                context,
                'Gender',
                CustomBottomSheetBody(
                  onTapped: (val) {
                    gender = val;
                    loadingWrapper(() async {
                      await homeController.getProducts(
                        query: {'gender': gender},
                        refresh: true,
                      );
                    });
                    controller.update();
                    Navigator.pop(context);
                  },
                  containers: const [
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
                () {
                  loadingWrapper(() async {
                    await homeController.getProducts(
                      refresh: true,
                    );
                  });
                  controller.update();
                  Navigator.pop(context);
                },
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
