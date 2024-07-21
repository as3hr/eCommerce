import 'package:flutter/material.dart';

class CustomTableDesign extends StatelessWidget {
  const CustomTableDesign({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,
        elevation: 10,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: child,
        ),
      ),
    );
  }
}
