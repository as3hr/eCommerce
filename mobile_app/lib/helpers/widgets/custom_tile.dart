import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    this.leading,
    this.subTitle,
    this.title,
    this.trailing,
    this.height,
    this.width,
    this.trailingOnTap,
    this.borderRadius,
    this.color,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? trailing;
  final Function()? trailingOnTap;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height ?? 60,
        width: width ?? 0.85.sw,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.onPrimary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: ListTile(
          leading: leading,
          title: title,
          subtitle: subTitle,
          trailing: GestureDetector(onTap: trailingOnTap, child: trailing),
        ),
      ),
    );
  }
}
