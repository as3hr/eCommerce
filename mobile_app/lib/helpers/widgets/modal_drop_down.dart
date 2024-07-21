import '../styles/app_decoration.dart';
import '../styles/app_images.dart';
import 'package:flutter/material.dart';

class ModalDropDown extends StatelessWidget {
  const ModalDropDown(
      {super.key,
      required this.text,
      this.color,
      required this.onTap,
      this.textColor});
  final String text;
  final Function() onTap;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: IntrinsicWidth(
          child: Row(children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color ?? Theme.of(context).colorScheme.onPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          text,
                          style: AppDecoration.mediumStyle(
                              fontSize: 15,
                              color: textColor ??
                                  Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: const AssetImage(AppImages.arrowDropDown),
                          color: textColor ??
                              Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
