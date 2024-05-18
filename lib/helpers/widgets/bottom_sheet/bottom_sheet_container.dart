import '../../styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/app_colors.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.title,
    required this.index,
    this.onChanged,
    this.isSelected = false,
  });
  final bool isSelected;
  final int index;
  final Function(String)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(title);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: 0.9.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: isSelected
                ? AppColors.lightPurple
                : Theme.of(context).colorScheme.onPrimary,
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
                          : Theme.of(context).colorScheme.onSecondary),
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
  }
}
