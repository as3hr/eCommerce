import 'package:flutter/material.dart';

import '../../../../helpers/widgets/bottom_sheet_container.dart';

class HomeGenderBottomSheet extends StatelessWidget {
  const HomeGenderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BottomSheetContainer(
          index: 0,
          title: 'Men',
        ),
        BottomSheetContainer(
          index: 1,
          title: 'Women',
        ),
        BottomSheetContainer(
          index: 2,
          title: 'Kids',
        ),
      ],
    );
  }
}
