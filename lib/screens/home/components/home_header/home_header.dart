import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/widgets/bottom_sheet/sheet.dart';
import 'package:e_commerce/screens/home/components/cart/cart_controller.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/bottom_sheet.dart';
import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/widgets/modal_drop_down.dart';
import '../../../../helpers/widgets/bottom_sheet/custom_bottom_sheet_body.dart';
import '../../../../helpers/widgets/rounded_image.dart';
import '../../../auth/auth_controller.dart';
import '../cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/styles/app_colors.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String gender = 'Men';
  int bottomSheetCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      final user = Get.find<AuthController>().user;
      final homeController = Get.find<HomeScreenController>();
      final name = user.firstName;
      final image = user.image;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RoundedImage(
                imageUrl: image,
                iconText: name,
                radius: 30.w,
              )),
          ModalDropDown(
            text: gender,
            onTap: () {
              viewBottomSheet(
                context,
                'Gender',
                CustomBottomSheetBody(
                  onTapped: (val, index) {
                    gender = val;
                    bottomSheetCurrentIndex = index;
                    loadingWrapper(() async {
                      await homeController.getProducts(
                        query: {'gender': gender},
                        refresh: true,
                      );
                    });
                    controller.update();
                    Navigator.pop(context);
                  },
                  containers: [
                    Sheet(
                      index: 0,
                      title: 'Men',
                    ),
                    Sheet(
                      index: 1,
                      title: 'Women',
                    ),
                    Sheet(
                      index: 2,
                      title: 'Kids',
                    ),
                  ],
                  currentIndex: bottomSheetCurrentIndex,
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
