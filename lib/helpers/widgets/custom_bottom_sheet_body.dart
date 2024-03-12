import 'package:e_commerce/helpers/widgets/bottom_sheet/bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_sheet/bottom_sheet_container.dart';

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody(
      {super.key, required this.containers, this.onTapped});
  final List<BottomSheetContainer> containers;
  final Function(String)? onTapped;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BottomSheetController(),
        builder: (controller) {
          return Expanded(
              child: ListView.builder(
                  itemCount: containers.length,
                  itemBuilder: (context, index) {
                    final container = containers[index];
                    return BottomSheetContainer(
                        onChanged: (val) {
                          onTapped?.call(val).then((value) => Get.back());
                        },
                        title: container.title,
                        index: index);
                  }));
        });
  }
}
