import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/form_fields.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/functions/form_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BaseNestedFormField extends StatelessWidget {
  const BaseNestedFormField({super.key, required this.formFieldList});
  final List<BaseFormFieldModel> formFieldList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 160.0, left: 10, top: 12, bottom: 12),
        child: DottedBorder(
            color: AppColors.grayI,
            strokeWidth: 2,
            borderType: BorderType.Rect,
            radius: const Radius.circular(20),
            dashPattern: const [5, 5],
            child: Column(
              children: formFieldList.map((field) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (field.childrens?.isEmpty ?? true)
                        FormHelpers.getFieldWidget(field, context),
                      if (field.childrens?.isNotEmpty ?? false)
                        BaseNestedFormField(
                            formFieldList: field.childrens ?? []),
                    ],
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
