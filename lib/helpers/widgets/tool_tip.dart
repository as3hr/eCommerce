import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class ToolTip extends StatelessWidget {
  const ToolTip({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.content,
    this.tailLength,
    this.toolTipDirection,
  });
  final double? tailLength;
  final Widget content;
  final Widget child;
  final Color backgroundColor;
  final AxisDirection? toolTipDirection;
  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      preferredDirection: toolTipDirection ?? AxisDirection.up,
      showDuration: const Duration(milliseconds: 100),
      backgroundColor: backgroundColor,
      tailLength: tailLength ?? 0,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
      child: child,
    );
  }
}
