import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class BaseImageFormField extends StatefulWidget {
  const BaseImageFormField({super.key, required this.prefixImages});
  final List<String> prefixImages;

  @override
  State<BaseImageFormField> createState() => _BaseImageFormFieldState();
}

class _BaseImageFormFieldState extends State<BaseImageFormField> {
  final ImagePicker picker = ImagePicker();
  List<XFile> images = [];
  @override
  Widget build(BuildContext context) {
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
              widget.prefixImages.isEmpty && images.isEmpty
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
                              child: Image.file(
                                File(image.path),
                                width: 120,
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    images.removeAt(index);
                                    setState(() {});
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
                      onTap: () async {
                        images = await picker.pickMultiImage();
                        setState(() {});
                      },
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
