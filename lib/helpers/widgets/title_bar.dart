import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              const CircleAvatar(
                backgroundColor: AppColors.navy,
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
              3.horizontalSpace,
              Text(
                'admin@gmail.com',
                style: mediumTextStyle,
              ),
              10.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
