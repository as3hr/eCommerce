import 'package:ecommerce_admin_panel/helpers/widgets/window_title_bar.dart';
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
        // Side Bar
        const SideBar(),
        Expanded(
          child: Column(
            children: [
              // Title Bar
              WindowTitleBar(),
              const TitleBar(),

              Expanded(child: child)
            ],
          ),
        ),
      ],
    );
  }
}
