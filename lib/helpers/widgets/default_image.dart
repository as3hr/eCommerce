import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class DefaultImage extends StatelessWidget {
  final String? text;
  final double size;
  final double? borderRadius;
  final bool showBorder;
  const DefaultImage({
    super.key,
    this.text,
    this.size = 45,
    this.borderRadius,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? size),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? size),
          border: showBorder
              ? Border.all(
                  width: 2,
                )
              : null,
        ),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: size / 2.5,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
            child: Text(
              (text?.split(' ').map((word) => word[0]).join().toUpperCase() ??
                  ''),
            ),
          ),
        ),
      ),
    );
  }
}
