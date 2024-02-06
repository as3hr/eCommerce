import 'package:flutter/material.dart';

import 'bottom_sheet/bottom_sheet_container.dart';

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody({super.key, required this.containers});
  final List<BottomSheetContainer> containers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: containers
              .map((container) => BottomSheetContainer(
                  title: container.title, index: container.index))
              .toList()),
    );
  }
}
