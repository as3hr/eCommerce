import 'package:get/get.dart';

import '../styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

void viewBottomSheet(BuildContext context, String titleText,
    Widget bottomSheetBody, Function() onClearTap) {
  showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      backgroundColor: AppColors.pureWhite,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 0.45.sh,
          child: Column(
            children: [
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      onClearTap.call();
                      Get.back();
                    },
                    child: Text(
                      'Clear',
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 20, color: AppColors.pureBlack),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      titleText,
                      style: AppDecoration.boldStyle(
                          fontSize: 23, color: AppColors.pureBlack),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'X',
                      style: AppDecoration.semiBoldStyle(
                          fontSize: 20, color: AppColors.pureBlack),
                    ),
                  ),
                ],
              ),
              25.verticalSpace,
              bottomSheetBody,
            ],
          ),
        );
      });
}
