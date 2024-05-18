import '../../../helpers/styles/app_decoration.dart';
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
        Center(
            child: Text(
          'No Notification yet',
          style: AppDecoration.boldStyle(
              fontSize: 20, color: Theme.of(context).colorScheme.onSecondary),
        )),
      ],
    );
  }
}
