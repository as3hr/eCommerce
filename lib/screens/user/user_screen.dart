import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:flutter/material.dart';

import '../../helpers/widgets/form/base_form.dart';
import '../../helpers/widgets/form/form_fields.dart';
import '../../models/user.dart';
import '../../routes/route_name.dart';
import '../../theme.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user';
  const UserScreen({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onBackground,
      body: Column(
        children: [
          CustomHeader(
            previousRoute: RouteName.userList,
            formTitle: 'Users',
            onPressed: () {},
          ),
          Expanded(
              child: BaseForm(getFormData: () async {}, formFieldsList: [
            BaseTextFieldModel(title: 'Field 1'),
            BaseTextFieldModel(title: 'Field 2'),
            BaseTextFieldModel(title: 'Field 1'),
            BaseTextFieldModel(title: 'Field 2'),
            BaseTextFieldModel(title: 'Field 1'),
            BaseTextFieldModel(title: 'Field 2'),
          ]))
        ],
      ),
    );
  }
}
