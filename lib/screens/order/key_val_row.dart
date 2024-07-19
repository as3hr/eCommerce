import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';

class KeyValRow extends StatelessWidget {
  const KeyValRow(
      {super.key, required this.keyText, required this.value, this.space});
  final String keyText;
  final Widget value;
  final double? space;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(keyText,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: lightColorScheme.onSecondary,
          )),
      space?.horizontalSpace ?? 35.horizontalSpace,
      value
    ]);
  }
}
