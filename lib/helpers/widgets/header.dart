import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_decoration.dart';
import 'back_button.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.text,
      this.extraSpace,
      this.trailingTap,
      this.trailingIcon});
  final String text;
  final int? extraSpace;
  final IconData? trailingIcon;
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
                fontSize: 23, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        if (trailingIcon != null && trailingTap != null) ...[
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: trailingTap,
                child: Icon(
                  trailingIcon,
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
          ),
        ]
      ],
    );
  }
}
