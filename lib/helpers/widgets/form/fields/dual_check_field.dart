import 'package:flutter/material.dart';

import '../../../../theme.dart';
import '../../check_box_field.dart';

// ignore: must_be_immutable
class DualCheckField extends StatefulWidget {
  bool isChecked1;
  bool isChecked2;
  final void Function(bool?)? onChanged1;
  final void Function(bool?)? onChanged2;
  final dynamic preFilledValue2;
  final dynamic preFilledValue1;
  final String? title1;
  final String? title2;
  final double? width;
  DualCheckField({
    super.key,
    this.width,
    this.title1,
    this.title2,
    required this.onChanged1,
    required this.onChanged2,
    this.preFilledValue1,
    this.preFilledValue2,
    this.isChecked1 = false,
    this.isChecked2 = false,
  });

  @override
  State<DualCheckField> createState() => _DualCheckFieldState();
}

class _DualCheckFieldState extends State<DualCheckField> {
  @override
  void initState() {
    super.initState();
    widget.isChecked1 = widget.preFilledValue1 ?? false;
    widget.isChecked2 = widget.preFilledValue2 ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //first check field
            Expanded(
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: boxDecoration,
                child: CheckBoxField(
                  key: Key('${widget.preFilledValue1}'),
                  title: widget.title1.toString(),
                  onChanged: widget.onChanged1,
                  isChecked: widget.isChecked1,
                ),
              ),
            ),

            const SizedBox(
              width: 40,
            ),

            //Second check field
            Expanded(
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: boxDecoration,
                child: CheckBoxField(
                  key: Key('${widget.preFilledValue2}'),
                  title: widget.title2.toString(),
                  onChanged: widget.onChanged2,
                  isChecked: widget.isChecked2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
