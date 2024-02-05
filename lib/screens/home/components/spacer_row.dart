import 'package:flutter/material.dart';

class SpacerRow extends StatelessWidget {
  const SpacerRow({super.key, required this.text1, this.text2});
  final String text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1),
          Text(text2 ?? ''),
        ],
      ),
    );
  }
}
