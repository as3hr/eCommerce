import 'package:flutter/material.dart';

import '../../helpers/widgets/form/base_form.dart';
import '../../helpers/widgets/form/form_fields.dart';
import '../../helpers/widgets/header/custom_header.dart';
import '../../routes/route_name.dart';
import '../../theme.dart';

class LeadScreen extends StatelessWidget {
  static const routeName = '/leads';
  const LeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onBackground,
      body: Column(
        children: [
          CustomHeader(
            previousRoute: RouteName.addressesList,
            formTitle: 'Leads',
            onPressed: () {},
          ),
          Expanded(
              child: BaseForm(formFieldsList: [
            BaseEditableFieldModel(childrens: [
              BaseSuggestionFieldModel(title: 'Suggestion Field'),
              BaseTextFieldModel(title: 'Text Field'),
              BaseEditableFieldModel(childrens: [
                BaseTextFieldModel(title: 'Text Field'),
                BaseTextFieldModel(title: 'Text Field'),
              ]),
            ]),
          ]))
        ],
      ),
    );
  }
}
