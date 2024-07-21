import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
