import 'dart:ui';

import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider(
      {super.key, required this.images, required this.pageController});
  final List<String> images;
  final PageController pageController;

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 4, sigmaY: 4, tileMode: TileMode.repeated),
      child: SizedBox(
        height: 0.5.sh,
        width: 1.sw,
        child: PhotoViewGallery.builder(
          enableRotation: false,
          backgroundDecoration:
              const BoxDecoration(color: AppColors.transparent),
          allowImplicitScrolling: true,
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              heroAttributes: PhotoViewHeroAttributes(
                tag: index,
                transitionOnUserGestures: true,
              ),
              filterQuality: FilterQuality.high,
              imageProvider: NetworkImage(widget.images[index]),
              initialScale: PhotoViewComputedScale.covered * 0.4,
              minScale: PhotoViewComputedScale.contained * 1.2,
              maxScale: PhotoViewComputedScale.covered * 0.8,
            );
          },
          itemCount: widget.images.length,
          loadingBuilder: (context, event) {
            return const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Indicator(),
              ),
            );
          },
          pageController: widget.pageController,
          // onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
