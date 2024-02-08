import 'package:flutter/material.dart';

import 'bottom_sheet/bottom_sheet_container.dart';

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody({super.key, required this.containers});
  final List<BottomSheetContainer> containers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: containers.length,
            itemBuilder: (context, index) {
              final container = containers[index];
              return BottomSheetContainer(title: container.title, index: index);
            }));
  }
}
