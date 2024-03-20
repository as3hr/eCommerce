import 'package:ecommerce_admin_panel/helpers/image_controller.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/base_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../extensions/theme_colors.dart';

class BaseImageFormField extends StatefulWidget {
  const BaseImageFormField(
      {super.key, required this.imageUrl, required this.prefixImage});
  final String imageUrl;
  final String prefixImage;

  @override
  State<BaseImageFormField> createState() => _BaseImageFormFieldState();
}

class _BaseImageFormFieldState extends State<BaseImageFormField> {
  late DropzoneViewController controller;
  final imageController = ImageController();
  String image = '';
  bool isMemoryImage = false;
  Uint8List? fileBytes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: DottedBorder(
          color: ThemeColors.grayI,
          strokeWidth: 2,
          borderType: BorderType.Rect,
          radius: const Radius.circular(20),
          dashPattern: const [10, 10],
          child: Column(
            children: [
              BaseTextField(
                width: 0.2.sw,
                readOnly: true,
                preFilledValue: widget.imageUrl,
                suffixIcon: InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                        const ClipboardData(text: "your text"));
                  },
                  child: const Icon(
                    Icons.copy_all,
                    color: ThemeColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  await imageController.pickImage();
                  // FilePickerResult? result = await FilePicker.platform
                  //     .pickFiles(
                  //         allowMultiple: false,
                  //         type: FileType.custom,
                  //         allowedExtensions: ['jpg', 'jpeg', 'png']);
                  // if (result != null) {
                  //   fileBytes = result.files.first.bytes;
                  //   isMemoryImage = true;
                  //   setState(() {});
                  // }
                  if (imageController.fileResult != null) {
                    await imageController.uploadFile();
                  }
                },
                child: SizedBox(
                  width: 1.sw,
                  height: 400,
                  child: Stack(
                    children: [
                      DropzoneView(
                        operation: DragOperation.copy,
                        cursor: CursorType.grab,
                        onCreated: (ctrl) {
                          controller = ctrl;
                        },
                        onDrop: (drop) {
                          image = drop;
                          isMemoryImage = false;
                          setState(() {});
                        },
                      ),
                      (isMemoryImage && fileBytes != null)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Image.memory(
                                  fileBytes!,
                                  height: 0.75.sh,
                                  width: 0.4.sw,
                                ),
                              ),
                            )
                          : image != ''
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Image.network(
                                      image,
                                      height: 0.75.sh,
                                      width: 0.4.sw,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text('Drop or Pick your Image'),
                                ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
