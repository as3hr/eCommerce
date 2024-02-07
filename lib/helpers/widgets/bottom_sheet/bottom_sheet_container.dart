import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/widgets/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../styles/app_colors.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.title,
    required this.index,
  });
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BottomSheetController(),
        builder: (controller) {
          bool isSelected = index == controller.bottomSheetCurrentIndex;
          return GestureDetector(
            onTap: () {
              controller.setIndex(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 0.9.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: isSelected ? AppColors.lightPurple : AppColors.grayI,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: AppDecoration.semiBoldStyle(
                            fontSize: 20,
                            color: isSelected
                                ? AppColors.pureWhite
                                : AppColors.pureBlack),
                      ),
                      if (isSelected)
                        const Icon(
                          Icons.check,
                          color: AppColors.pureWhite,
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
