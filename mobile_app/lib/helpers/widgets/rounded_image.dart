import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'default_image.dart';

class RoundedImage extends StatelessWidget {
  final String? imageUrl;
  final File? file;
  final String? assetPath;
  final String? iconText;
  final double radius;
  final double? borderRadius;
  final BoxFit? boxFit;

  const RoundedImage({
    super.key,
    this.imageUrl,
    this.file,
    this.assetPath,
    this.iconText,
    this.radius = 70,
    this.borderRadius,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? radius),
      ),
      clipBehavior: Clip.antiAlias,
      child: (file != null)
          ? Image.file(
              file!,
              fit: BoxFit.cover,
              height: size,
              width: size,
            )
          : imageUrl != null
              ? FancyShimmerImage(
                  imageUrl: imageUrl ?? '',
                  errorWidget: DefaultImage(
                    text: iconText,
                    size: size,
                    borderRadius: borderRadius,
                    showBorder: true,
                  ),
                  boxFit: boxFit ?? BoxFit.cover,
                  height: size,
                  width: size,
                )
              : DefaultImage(
                  text: iconText,
                  size: size,
                  borderRadius: borderRadius,
                  showBorder: true,
                ),
    );
  }
}
