import 'package:e_commerce/helpers/widgets/bottom_sheet/sheet.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_container.dart';

class CustomBottomSheetBody extends StatefulWidget {
  const CustomBottomSheetBody({
    super.key,
    required this.containers,
    this.onTapped,
    this.currentIndex = 0,
  });
  final int currentIndex;
  final List<Sheet> containers;
  final Function(String, int)? onTapped;

  @override
  State<CustomBottomSheetBody> createState() => _CustomBottomSheetBodyState();
}

class _CustomBottomSheetBodyState extends State<CustomBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.containers.length,
            itemBuilder: (context, index) {
              final container = widget.containers[index];
              return BottomSheetContainer(
                  onChanged: (val) {
                    widget.onTapped?.call(val, index);
                    setState(() {});
                  },
                  isSelected: widget.currentIndex == index,
                  title: container.title,
                  index: index);
            }));
  }
}
