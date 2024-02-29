import '../../../helpers/styles/app_decoration.dart';
import '../../../helpers/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 0.85.sw,
              decoration: BoxDecoration(
                color: AppColors.grayI,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Image(
                  image: AssetImage(AppImages.notification),
                  color: AppColors.pureBlack,
                ),
                title: Text(
                  'This is just for testing the UI This is just for testing the UI This is just for testing the UI',
                  style: AppDecoration.lightStyle(
                      fontSize: 15, color: AppColors.pureBlack),
                ),
              ),
            ),
          );
        });
  }
}
