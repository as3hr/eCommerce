import 'package:flutter/material.dart';

import '../custom_elevated_button.dart';

class BaseFormButton extends StatelessWidget {
  const BaseFormButton({
    super.key,
    required this.text,
    required this.toolTipText,
    required this.onPressed,
    this.textColor,
    this.showCheck = false,
  });
  final bool showCheck;
  final Color? textColor;
  final String text;
  final String? toolTipText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return
        //  ToolTip(
        //   backgroundColor: ThemeColors.white,
        //   content: toolTipText != null
        //       ? Text(
        //           toolTipText!,
        //           style: smallTextStyle,
        //         )
        //       : Text(
        //           'Disabled',
        //           style: smallTextStyle,
        //         ),
        //   child:
        CustomElevatedButton(
      showCheck: showCheck,
      onPressed: onPressed,
      text: text,
      textColor: textColor,
      // ),
    );
  }
}
