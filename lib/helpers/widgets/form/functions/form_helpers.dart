import 'package:ecommerce_admin_panel/helpers/extensions/extension.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/base_nested_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../fields/base_date_field.dart';
import '../fields/base_image_field.dart';
import '../fields/base_multi_select.dart';
import '../fields/base_number_field.dart';
import '../fields/base_suggestion_field.dart';
import '../fields/base_text_field.dart';
import '../fields/check_field.dart';
import '../fields/drop_down_field.dart';
import '../fields/dual_check_field.dart';
import '../form_fields.dart';

class FormHelpers {
  static Widget getFieldWidget(
      BaseFormFieldModel formField, BuildContext context) {
    final isScreenLarge = context.width > 700;
    if (formField is BaseNestedFieldModel) {
      return BaseNestedFormField(formFieldList: formField.childrens ?? []);
    }
    if (formField is BaseImageFieldModel) {
      return BaseImageFormField(
        prefixImages: formField.preFixImages,
      );
    }
    if (formField is BaseDropDownFieldModel) {
      return DropDownField(
        key: Key('${formField.preFilledVal}'),
        preFilledVal: formField.preFilledVal,
        width: isScreenLarge ? 0.3.sw : 0.3.sw,
        title: formField.title,
        dropdownItems: formField.dropdownItems,
        onChanged: formField.onSelected,
      );
    }
    if (formField is BaseDateFieldModel) {
      return BaseDateField(
        key: Key('${formField.preFilledDate}'),
        readOnly: formField.readOnly,
        width: isScreenLarge ? 0.3.sw : 0.3.sw,
        preFilledDate: formField.preFilledDate,
        hintText: formField.hintText,
        title: formField.title,
        onChanged: formField.onSelected,
      );
    }
    if (formField is BaseSuggestionFieldModel) {
      return BaseSuggestionField(
        key: Key('${formField.preFilledVal}'),
        hideSuffixIcon: formField.hideSuffixIcon,
        preFilledValue: formField.preFilledVal,
        width: isScreenLarge ? 0.5.sw : 0.3.sw,
        readOnly: formField.readOnly,
        title: formField.title,
        onChanged: formField.onChanged,
        onSelected: formField.onSelected,
        isRequired: formField.isRequired,
        isNum: formField.isNum,
        hintText: formField.hintText,
      );
    }
    if (formField is BaseCheckFieldModel) {
      return CheckField(
        key: Key('${formField.preFilledValue}'),
        title: formField.title,
        isChecked: formField.isChecked ?? false,
        width: isScreenLarge ? 0.3.sw : 0.3.sw,
        preFilledValue: formField.preFilledValue,
        onChanged: formField.onSelected,
      );
    }
    if (formField is BaseDualCheckFieldModel) {
      return DualCheckField(
        isChecked1: formField.isChecked1 ?? false,
        isChecked2: formField.isChecked2 ?? false,
        onChanged1: formField.onChanged1,
        onChanged2: formField.onChanged2,
        title1: formField.title1,
        title2: formField.title2,
        width: isScreenLarge ? 0.3.sw : 0.3.sw,
        preFilledValue1: formField.preFilledValue1,
        preFilledValue2: formField.preFilledValue2,
      );
    }
    if (formField is BaseMultiSelectFieldModel) {
      return BaseMultiSelect(
        key: Key('${formField.preFilledValue}'),
        readOnly: formField.readOnly,
        onChanged: formField.onSelected,
        dropdownItems: formField.dropdownItems,
        title: formField.title,
        width: isScreenLarge ? 0.3.sw : 0.3.sw,
        preFilledText: formField.preFilledValue,
        selectedValues: formField.selectedValues ?? [],
      );
    }
    if (formField is BaseNumberFieldModel) {
      return BaseNumberField(
        key: Key('${formField.prefixNumber}'),
        readOnly: formField.readOnly,
        preFilledNumber: formField.prefixNumber,
        title: formField.title ?? '',
        hintText: formField.hintText,
        width: isScreenLarge ? 0.5.sw : 0.3.sw,
        onChanged: formField.onSelected,
      );
    }
    if (formField is BaseTextFieldModel) {
      return BaseTextField(
        key: Key('${formField.prefixText}'),
        width: isScreenLarge ? 0.5.sw : 0.3.sw,
        isMultiLineField: formField.isMultiLineField,
        preFilledValue: formField.prefixText,
        readOnly: formField.readOnly,
        title: formField.title,
        hintText: formField.hintText,
        onChanged: formField.onSelected,
      );
    }
    if (formField is BaseEmptyFieldModel) {
      return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}
