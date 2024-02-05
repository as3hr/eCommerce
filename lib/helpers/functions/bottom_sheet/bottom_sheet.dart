import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

void viewBottomSheet(
    BuildContext context, String titleText, Widget bottomSheetBody) {
  showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      backgroundColor: AppColors.pureWhite,
      context: context,
      builder: (context) {
        return Column(
          children: [
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Clear'),
                Text(titleText),
                const Text('X'),
              ],
            ),
            25.verticalSpace,
            bottomSheetBody,
          ],
        );
      });
}
