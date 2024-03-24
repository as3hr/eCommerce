import 'package:ecommerce_admin_panel/helpers/widgets/form/base_form.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/form_fields.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../helpers/extensions/theme_colors.dart';
import '../../helpers/widgets/header/custom_header.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.grayBackground,
      body: Column(
        children: [
          CustomHeader(
            previousRoute: RouteName.ordersList,
            formTitle: 'Orders',
            onPressed: () {},
          ),
          Expanded(
              child: BaseForm(formFieldsList: [
            BaseNestedFieldModel(childrens: [
              BaseDateFieldModel(title: 'Date Field'),
              BaseTextFieldModel(title: 'Text Field'),
              BaseNestedFieldModel(childrens: [
                BaseDateFieldModel(title: 'Date Field'),
                BaseTextFieldModel(title: 'Text Field'),
              ]),
              BaseNestedFieldModel(childrens: [
                BaseDateFieldModel(title: 'Date Field'),
                BaseTextFieldModel(title: 'Text Field'),
              ]),
              BaseNestedFieldModel(childrens: [
                BaseDateFieldModel(title: 'Date Field'),
                BaseTextFieldModel(title: 'Text Field'),
              ]),
            ]),
          ]))
        ],
      ),
    );
  }
}
