import '../../styles/app_decoration.dart';
import 'bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../styles/app_colors.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.title,
    required this.index,
    this.onChanged,
  });
  final int index;
  final Function(String)? onChanged;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.setIndex(index);
          onChanged?.call(title);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 0.9.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: index == controller.bottomSheetCurrentIndex
                  ? AppColors.lightPurple
                  : AppColors.grayI,
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
                        color: index == controller.bottomSheetCurrentIndex
                            ? AppColors.pureWhite
                            : AppColors.pureBlack),
                  ),
                  if (index == controller.bottomSheetCurrentIndex)
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
