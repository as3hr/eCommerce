import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/app_decoration.dart';
import '../../../styles/app_images.dart';
import '../../custom_tile.dart';

class ItemSizeQuantity extends StatelessWidget {
  const ItemSizeQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
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
                CircleAvatar(
                  backgroundColor: AppColors.lightPurple,
                  child: Center(
                      child: Text(
                    '+',
                    style: AppDecoration.mediumStyle(
                        fontSize: 19, color: AppColors.pureWhite),
                  )),
                ),
                15.horizontalSpace,
                Text(
                  '1',
                  style: AppDecoration.boldStyle(
                      fontSize: 17, color: AppColors.pureBlack),
                ),
                15.horizontalSpace,
                CircleAvatar(
                  backgroundColor: AppColors.lightPurple,
                  child: Center(
                      child: Text(
                    "−",
                    style: AppDecoration.mediumStyle(
                        fontSize: 19, color: AppColors.pureWhite),
                  )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
