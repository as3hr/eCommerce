import 'package:flutter/material.dart';

import '../../helpers/widgets/side_bar/side_bar.dart';
import '../../helpers/widgets/title_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SideBar(),
        Expanded(
          child: Column(
            children: [const TitleBar(), Expanded(child: child)],
          ),
        ),
      ],
    );
  }
}
