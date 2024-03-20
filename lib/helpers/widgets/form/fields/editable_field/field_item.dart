import 'package:ecommerce_admin_panel/helpers/widgets/form/form_fields.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/theme_colors.dart';
import '../../functions/form_helpers.dart';

class FieldItem extends StatelessWidget {
  const FieldItem({super.key, required this.formFieldsList});
  final List<BaseFormFieldModel> formFieldsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        color: ThemeColors.grayI,
        strokeWidth: 2,
        borderType: BorderType.Rect,
        radius: const Radius.circular(20),
        dashPattern: const [5, 2],
        child: Column(
            children: formFieldsList.map((formField) {
          return Column(
            children: [
              if (formField.childrens?.isEmpty ?? true)
                FormHelpers.getFieldWidget(formField, context),
              if (formField.childrens?.isNotEmpty ?? false)
                FieldItem(formFieldsList: formField.childrens ?? []),
            ],
          );
        }).toList()),
      ),
    );
  }
}
