import 'package:ecommerce_admin_panel/helpers/widgets/form/form_fields.dart';
import 'package:flutter/material.dart';

class EditableField {
  List<BaseFormFieldModel> formFieldsList;
  IconData icon;

  EditableField(
      {required this.formFieldsList, this.icon = Icons.delete_forever_rounded});
}
