import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer_effect.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({super.key, required this.imageUrl, this.errorIcon});
  final String imageUrl;
  final IconData? errorIcon;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 120,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimary,
              BlendMode.dst,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const ShimmerEffect(),
      errorWidget: (context, url, error) => Icon(errorIcon ?? Icons.error),
    );
  }
}
