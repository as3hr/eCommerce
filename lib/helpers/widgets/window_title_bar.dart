import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/extensions/theme_colors.dart';

class WindowTitleBar extends StatelessWidget {
  WindowTitleBar({Key? key}) : super(key: key);

  final buttonColors = WindowButtonColors(
    iconNormal: Get.theme.colorScheme.primary,
  );

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        decoration: BoxDecoration(color: Get.theme.colorScheme.background),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Expanded(
            //   child: MoveWindow(
            //     child: Align(
            //       alignment: Alignment.centerLeft,
            //       child: Image.asset(AssetImages.access),
            //     ),
            //   ),
            // ),
            MinimizeWindowButton(
              colors: buttonColors,
            ),
            MaximizeWindowButton(
              colors: buttonColors,
            ),
            CloseWindowButton(
              colors: WindowButtonColors(
                iconNormal: Get.theme.colorScheme.primary,
                mouseOver: ThemeColors.focusRed,
              ),
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text(
                      'Are you sure you want to close this window?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: Get.back,
                        child: const Text('No'),
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Get.back();
                          appWindow.close();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
