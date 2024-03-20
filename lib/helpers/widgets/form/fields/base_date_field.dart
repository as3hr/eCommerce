// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme.dart';

class BaseDateField<T> extends StatefulWidget {
  const BaseDateField({
    Key? key,
    this.width,
    required this.title,
    this.hintText,
    this.preFilledDate,
    this.readOnly = false,
    required this.onChanged,
  }) : super(key: key);
  final double? width;
  final String? title;
  final bool readOnly;
  final String? hintText;
  final Function(DateTime)? onChanged;
  final DateTime? preFilledDate;
  @override
  _BaseDateFieldState createState() => _BaseDateFieldState();
}

class _BaseDateFieldState extends State<BaseDateField> {
  late TextEditingController _dateController;
  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: widget.preFilledDate != null
          ? DateFormat('dd/MM/yyyy')
              .format(DateTime.parse(widget.preFilledDate.toString()))
          : null,
    );
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
          child: TextFormField(
            readOnly: widget.readOnly,
            style: Theme.of(context).textTheme.bodyMedium,
            controller: _dateController,
            onTap: widget.readOnly
                ? null
                : () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2028),
                    );
                    if (selectedDate != null) {
                      widget.onChanged?.call(selectedDate);
                      _dateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                    }
                  },
            decoration: fieldDecoration(
              label: widget.title,
              hintText: widget.hintText,
              suffixIcon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
