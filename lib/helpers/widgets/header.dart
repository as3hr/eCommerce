import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import '../styles/app_decoration.dart';
import 'back_button.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.text,
      this.extraSpace,
      this.trailingTap,
      this.showTrailing = false});
  final String text;
  final int? extraSpace;
  final bool showTrailing;
  final void Function()? trailingTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        20.horizontalSpace,
        const CustomBackButton(),
        if (extraSpace != null) extraSpace!.horizontalSpace,
        90.horizontalSpace,
        Center(
          child: Text(
            text,
            style: AppDecoration.boldStyle(
                fontSize: 23, color: AppColors.pureBlack),
          ),
        ),
        if (showTrailing) ...[
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: trailingTap,
                child: const Icon(
                  Icons.add_circle_outlined,
                  color: AppColors.grayIV,
                )),
          ),
        ]
      ],
    );
  }
}
