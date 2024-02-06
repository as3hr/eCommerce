import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_images.dart';
import '../../../helpers/widgets/custom_tile.dart';
import 'profile_option.dart';

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.48.sh,
      child: ListView.builder(
          itemCount: ProfileOption.allOptions.length,
          itemBuilder: (context, index) {
            final option = ProfileOption.allOptions[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomTile(
                leading: Text(option.title),
                trailing:
                    const Image(image: AssetImage(AppImages.arrowForward)),
                trailingOnTap: option.onTap,
              ),
            );
          }),
    );
  }
}
