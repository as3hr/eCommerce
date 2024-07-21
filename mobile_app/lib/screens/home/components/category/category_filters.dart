import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/screens/home/components/category/category_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/bottom_sheet.dart';
import '../../../../helpers/functions/loader.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/widgets/bottom_sheet/custom_bottom_sheet_body.dart';
import '../../../../helpers/widgets/bottom_sheet/sheet.dart';
import '../../../../helpers/widgets/custom_container.dart';
import '../../../../helpers/widgets/modal_drop_down.dart';

class CategoryFilters extends StatelessWidget {
  const CategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryScreenController>(builder: (controller) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  onTap: () {},
                  text: 'On Sale',
                  color:
                      context.isDark ? AppColors.lightIndigo : AppColors.grayI,
                  textColor: context.isDark
                      ? AppColors.pureWhite
                      : AppColors.pureBlack,
                  height: 35,
                  width: 0.19.sw,
                  fontSize: 15.5,
                )),
            ModalDropDown(
              text: controller.extraQuery['price'] ?? 'Price',
              textColor: AppColors.pureWhite,
              color: AppColors.lightPurple,
              onTap: () {
                viewBottomSheet(
                  context,
                  'Price',
                  CustomBottomSheetBody(
                      currentIndex: controller.priceSheetIndex,
                      onTapped: (val, index) async {
                        controller.priceSheetIndex = index;
                        // controller.extraQuery['price'] = val;
                        loadingWrapper(() async {
                          controller.getProducts();
                        });
                        Get.back();
                      },
                      containers: [
                        Sheet(title: 'Lowset-Highest Price', index: 0),
                        Sheet(title: 'Highest-Lowest Price', index: 1),
                      ]),
                  () {
                    controller.extraQuery.remove('price');
                    loadingWrapper(() async {
                      controller.getProducts();
                    });
                  },
                );
              },
            ),
            ModalDropDown(
              text: controller.extraQuery['sort'] ?? 'Sort By',
              onTap: () {
                viewBottomSheet(
                  context,
                  'Sort By',
                  CustomBottomSheetBody(
                      currentIndex: controller.sortSheetIndex,
                      onTapped: (val, index) async {
                        controller.sortSheetIndex = index;
                        controller.extraQuery['sort'] = val;
                        loadingWrapper(() async {
                          controller.getProducts();
                        });
                        Get.back();
                      },
                      containers: [
                        Sheet(title: 'Recommended', index: 0),
                        Sheet(title: 'Newest', index: 1),
                      ]),
                  () {
                    controller.extraQuery.remove('sort');
                    loadingWrapper(() async {
                      controller.getProducts();
                    });
                  },
                );
              },
            ),
            ModalDropDown(
              text: controller.extraQuery['gender'] ?? 'Men',
              textColor: AppColors.pureWhite,
              color: AppColors.lightPurple,
              onTap: () {
                viewBottomSheet(
                  context,
                  'Gender',
                  CustomBottomSheetBody(
                      currentIndex: controller.genderSheetIndex,
                      onTapped: (val, index) async {
                        controller.genderSheetIndex = index;
                        controller.extraQuery['gender'] = val;
                        loadingWrapper(() async {
                          controller.getProducts();
                        });
                        Get.back();
                      },
                      containers: [
                        Sheet(title: 'Men', index: 0),
                        Sheet(title: 'Women', index: 1),
                        Sheet(title: 'Kids', index: 2),
                      ]),
                  () {
                    controller.extraQuery.remove('gender');
                    loadingWrapper(() async {
                      controller.getProducts();
                    });
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
