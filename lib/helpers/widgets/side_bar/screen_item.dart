import 'package:ecommerce_admin_panel/helpers/functions/change_page.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/screen.dart';
import 'package:flutter/material.dart';

class ScreenItem extends StatelessWidget {
  const ScreenItem({
    super.key,
    required this.screen,
  });
  final Screen screen;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: () {
            changePage(context, screen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 70),
            child: Text(screen.title),
          )),
    );
  }
}
