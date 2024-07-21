import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_decoration.dart';

class ItemsExpansion extends StatefulWidget {
  const ItemsExpansion({
    super.key,
    this.leading,
    this.initiallyExpanded = false,
    required this.titleText,
    required this.children,
  });
  final List<Widget> children;
  final Widget? leading;
  final String titleText;
  final bool initiallyExpanded;

  @override
  State<ItemsExpansion> createState() => _ItemsExpansionState();
}

class _ItemsExpansionState extends State<ItemsExpansion> {
  late String trailingText;
  @override
  void initState() {
    super.initState();
    trailingText = widget.initiallyExpanded ? 'Hide all' : 'View all';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
          child: ExpansionTile(
        initiallyExpanded: widget.initiallyExpanded,
        shape: const Border(),
        onExpansionChanged: (val) {
          if (val) {
            trailingText = "Hide all";
          } else {
            trailingText = "View all";
          }
          setState(() {});
        },
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        collapsedBackgroundColor: Theme.of(context).colorScheme.onPrimary,
        expansionAnimationStyle: AnimationStyle(curve: Curves.easeIn),
        leading: widget.leading,
        title: Text(
          widget.titleText,
          style: AppDecoration.mediumStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSecondary),
        ),
        trailing: Text(
          trailingText,
          style: AppDecoration.mediumStyle(
              fontSize: 12, color: AppColors.lightPurple),
        ),
        children: widget.children,
      )),
    );
  }
}
