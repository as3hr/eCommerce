import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'image_type.dart';

class BaseImageFormField extends StatefulWidget {
  const BaseImageFormField({
    super.key,
    required this.prefixImages,
    required this.getImages,
  });
  final List<String> prefixImages;
  final Function(List<ImageType> images) getImages;
  @override
  State<BaseImageFormField> createState() => _BaseImageFormFieldState();
}

class _BaseImageFormFieldState extends State<BaseImageFormField> {
  final picker = ImagePicker();
  List<ImageType> images = [];
  List<XFile> imageFiles = [];

  @override
  void initState() {
    initializeImages();
    super.initState();
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
    setState(() {});
    widget.getImages.call(images);
  }

  @override
  Widget build(BuildContext context) {
    final lengthExceeded = images.length >= 4;
    images = lengthExceeded ? images.sublist(0, 4) : images;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 0.5.sw,
          height: 250,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: [
              images.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text('No images selected!'),
                      ),
                    )
                  : Row(
                      children: images.mapIndexed((index, image) {
                        return Stack(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 120,
                                  height: 160,
                                  child: image.hasPath
                                      ? Image.file(
                                          File(image.image),
                                          fit: BoxFit.cover,
                                          width: 120,
                                        )
                                      : Image.network(
                                          image.image,
                                          fit: BoxFit.cover,
                                          width: 120,
                                        ),
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
              if (images.isNotEmpty) const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: lengthExceeded ? null : addImages,
                      child: const Icon(
                        Icons.file_copy,
                        color: Colors.black,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
