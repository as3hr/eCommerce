import '../styles/app_decoration.dart';
import 'package:flutter/material.dart';

class SpacerRow extends StatelessWidget {
  const SpacerRow(
      {super.key,
      required this.text1,
      this.text2,
      this.text1Color,
      this.text2Tap,
      this.text2Color});
  final String text1;
  final String? text2;
  final void Function()? text2Tap;
  final Color? text1Color;
  final Color? text2Color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppDecoration.boldStyle(
                fontSize: 20,
                color: text1Color ?? Theme.of(context).colorScheme.onSecondary),
          ),
          GestureDetector(
            onTap: text2Tap,
            child: Text(
              text2 ?? '',
              style: AppDecoration.semiBoldStyle(
                  fontSize: 17,
                  color:
                      text2Color ?? Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
