import 'package:ecommerce_admin_panel/helpers/extensions/theme_colors.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/editable_field/editable_field.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/editable_field/field_item.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/editable_field/item_container.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/form_fields.dart';
import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BaseEditableFormField extends StatefulWidget {
  const BaseEditableFormField({super.key, required this.formFieldList});
  final List<BaseFormFieldModel> formFieldList;

  @override
  State<BaseEditableFormField> createState() => _BaseEditableFormFieldState();
}

class _BaseEditableFormFieldState extends State<BaseEditableFormField> {
  List<EditableField> finalFormField = [];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 160.0, left: 10, top: 12, bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                if (widget.formFieldList.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ItemContainer(
                        onTap: () {
                          List<BaseFormFieldModel> editableBaseformField = [];
                          for (var field in widget.formFieldList) {
                            editableBaseformField.add(field);
                          }
                          final editableField = EditableField(
                              formFieldsList: editableBaseformField);
                          finalFormField.insert(0, editableField);
                          setState(() {});
                        },
                        text: 'Add Item',
                        icon: Icons.add,
                        borderColor: ThemeColors.marjanda,
                        textColor: ThemeColors.marjanda,
                      ),
                    ),
                  ),
              ],
            ),
            if (finalFormField.isNotEmpty)
              DottedBorder(
                  color: ThemeColors.grayI,
                  strokeWidth: 2,
                  borderType: BorderType.Rect,
                  radius: const Radius.circular(20),
                  dashPattern: const [7, 5],
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: finalFormField.mapIndexed((index, field) {
                        return Row(
                          children: [
                            FieldItem(formFieldsList: field.formFieldsList),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  finalFormField.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(field.icon),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
