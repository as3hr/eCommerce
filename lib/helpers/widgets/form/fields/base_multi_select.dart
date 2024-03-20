import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

import '../../../../theme.dart';

class BaseMultiSelect<T> extends StatefulWidget {
  const BaseMultiSelect({
    Key? key,
    this.title,
    required this.onChanged,
    required this.dropdownItems,
    this.preFilledText,
    this.width,
    this.readOnly = false,
    required this.selectedValues,
  }) : super(key: key);

  final Function(List<dynamic>)? onChanged;
  final List<dynamic>? dropdownItems;
  final String? title;
  final double? width;
  final List<String>? preFilledText;
  final List<dynamic> selectedValues;
  final bool readOnly;
  @override
  State<BaseMultiSelect<T>> createState() => _BaseMultiSelectState<T>();
}

class _BaseMultiSelectState<T> extends State<BaseMultiSelect<T>> {
  String? displayedText;

  @override
  void initState() {
    super.initState();
    updateDisplayedText();
  }

  void updateDisplayedText() {
    setState(() {
      if (widget.selectedValues.isEmpty) {
        displayedText = '    Select Items';
      } else if (widget.selectedValues.length <= 3) {
        displayedText = widget.selectedValues
            .map((e) => e.toString())
            .reduce((a, b) => '$a , $b');
      } else {
        displayedText =
            '${widget.selectedValues[0]} ,${widget.selectedValues[1]}, ' '...';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          width: widget.width,
          child: Center(
            child: DropDownMultiSelect(
              readOnly: widget.readOnly,
              decoration: fieldDecoration(
                label: widget.title,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
              childBuilder: displayedText != null
                  ? (selectedValues) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Text(displayedText!),
                      );
                    }
                  : null,
              options: widget.dropdownItems ?? [],
              selectedValues: widget.selectedValues,
              onChanged: (value) {
                widget.onChanged?.call(value);
                updateDisplayedText();
              },
            ),
          ),
        ),
      ),
    );
  }
}
