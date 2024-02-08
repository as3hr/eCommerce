import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import '../styles/app_decoration.dart';
import 'back_button.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        20.horizontalSpace,
        const CustomBackButton(),
        90.horizontalSpace,
        Center(
          child: Text(
            text,
            style: AppDecoration.boldStyle(
                fontSize: 23, color: AppColors.pureBlack),
          ),
        ),
      ],
    );
  }
}
