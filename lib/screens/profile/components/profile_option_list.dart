import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';
import '../../../helpers/styles/app_images.dart';
import '../../../helpers/widgets/custom_tile.dart';
import 'profile_option.dart';

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.35.sh,
      child: ListView.builder(
          itemCount: ProfileOption.allOptions.length,
          itemBuilder: (context, index) {
            final option = ProfileOption.allOptions[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: option.onTap,
                child: CustomTile(
                  leading: Text(
                    option.title,
                    style: AppDecoration.mediumStyle(
                        fontSize: 17, color: AppColors.pureBlack),
                  ),
                  trailing: const Image(
                    image: AssetImage(AppImages.arrowForward),
                    color: AppColors.pureBlack,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
