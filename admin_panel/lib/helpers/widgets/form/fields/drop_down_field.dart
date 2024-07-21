import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme.dart';
import '../../../styles/app_colors.dart';

class DropDownField<T> extends StatefulWidget {
  const DropDownField({
    Key? key,
    this.title,
    required this.onChanged,
    required this.dropdownItems,
    this.preFilledVal,
    this.width,
  }) : super(key: key);
  final Function(T)? onChanged;
  final List<T>? dropdownItems;
  final String? title;
  final double? width;
  final T? preFilledVal;
  @override
  State<DropDownField<T>> createState() => _DropDownFieldState<T>();
}

class _DropDownFieldState<T> extends State<DropDownField<T>> {
  T? valueSelected;
  @override
  void initState() {
    super.initState();
    if (widget.dropdownItems!.isNotEmpty) {
      if (widget.preFilledVal != null) {
        valueSelected = widget.preFilledVal;
      } else {
        valueSelected = widget.dropdownItems![0];
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.onChanged!(valueSelected as T);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 70,
          width: widget.width ?? 0.51.sw,
          child: Column(
            children: [
              12.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: DropdownButtonFormField2<T>(
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.black,
                        width: 0.5,
                      ),
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    iconSize: 30,
                    iconDisabledColor: AppColors.black,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: fieldDecoration(
                    label: widget.title,
                  ),
                  value: valueSelected,
                  hint: const Text('Select an item'),
                  items: _buildDropdownItems(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        widget.onChanged?.call(value);
                        valueSelected = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<T>> _buildDropdownItems() {
    if (widget.dropdownItems == null) {
      return [
        DropdownMenuItem<T>(
          value: null,
          child: const Text(
            'Empty',
          ),
        ),
      ];
    }

    return widget.dropdownItems?.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                item.toString(),
              ),
            ),
          );
        }).toList() ??
        [];
  }
}
