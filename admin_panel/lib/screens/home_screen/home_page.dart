import 'package:ecommerce_admin_panel/helpers/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../helpers/widgets/side_bar/side_bar.dart';
import '../../helpers/widgets/title_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (context.isMin || !context.isMax)
          ? AppBar(
              title: const TitleBar(),
            )
          : null,
      drawer: (context.isMin || !context.isMax) ? const SideBar() : null,
      drawerScrimColor: Colors.grey.withOpacity(0.4),
      body: (!context.isMin && context.isMax)
          ? Row(
              children: [
                const SideBar(),
                Expanded(
                  child: Column(
                    children: [const TitleBar(), Expanded(child: child)],
                  ),
                ),
              ],
            )
          : Column(
              children: [Expanded(child: child)],
            ),
    );
  }
}
