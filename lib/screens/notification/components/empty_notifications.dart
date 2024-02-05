import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_images.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        250.verticalSpace,
        const Center(
          child: Image(image: AssetImage(AppImages.bellImage)),
        ),
        10.verticalSpace,
        const Center(child: Text('No Notification yet')),
      ],
    );
  }
}
