import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/styles/asset_images.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../styles/app_decoration.dart';
import 'image_type.dart';

class BaseImageFormField extends StatefulWidget {
  const BaseImageFormField({
    super.key,
    required this.prefixImages,
    required this.getImages,
  });
  final List<String> prefixImages;
  final void Function(List<ImageType> images) getImages;
  @override
  State<BaseImageFormField> createState() => _BaseImageFormFieldState();
}

class _BaseImageFormFieldState extends State<BaseImageFormField> {
  final picker = ImagePicker();
  bool showText = false;
  List<ImageType> images = [];
  List<XFile> imageFiles = [];

  @override
  void initState() {
    super.initState();
    initializeImages();
  }

  void initializeImages() {
    if (widget.prefixImages.isNotEmpty) {
      for (var image in widget.prefixImages) {
        images.add(ImageType(image: image));
      }
    }
  }

  Future<void> addImages() async {
    imageFiles = await picker.pickMultiImage();
    for (var image in imageFiles) {
      images.add(
          ImageType(image: image.path, hasPath: true, imageName: image.name));
    }
    setState(() {});
    widget.getImages.call(images);
  }

  void removeImage(int index) {
    images.removeAt(index);
    showText = false;
    setState(() {});
    widget.getImages.call(images);
  }

  void pickImage(bool lengthExceeded) {
    if (lengthExceeded) {
      showText = true;
      setState(() {});
    } else {
      addImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lengthExceeded = images.length >= 4;
    images = lengthExceeded ? images.sublist(0, 4) : images;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 0.5.sw,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: InkWell(
                          onTap: () => pickImage(lengthExceeded),
                          child: Image.asset(AssetImages.download)),
                      title: InkWell(
                        onTap: () => pickImage(lengthExceeded),
                        child: const Text(
                          'Click to upload images',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      subtitle: Text(
                        '(SVG, PNG, JPG or JPEG)',
                        style: AppDecoration.lightStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                  if (showText)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text('(There can be maximum of four images)',
                          style: AppDecoration.mediumStyle(
                              fontSize: 12, color: Colors.red)),
                    ),
                ],
              ),
              if (images.isNotEmpty)
                Row(
                  children: images.mapIndexed((index, image) {
                    return Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 120,
                              height: 160,
                              child: image.hasPath
                                  ? Image.network(
                                      image.image,
                                      fit: BoxFit.cover,
                                      width: 120,
                                    )
                                  : ShimmerImage(imageUrl: image.image),
                            )),
                        Positioned(
                            top: 0,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                removeImage(index);
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: Colors.grey,
                              ),
                            )),
                      ],
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
