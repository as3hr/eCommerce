import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:flutter/material.dart';

import '../../helpers/widgets/form/base_form.dart';
import '../../helpers/widgets/form/form_fields.dart';
import '../../routes/route_name.dart';
import '../../theme.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/logs';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onBackground,
      body: Column(
        children: [
          CustomHeader(
            previousRoute: RouteName.notificationsList,
            formTitle: 'Notifications',
            onPressed: () {},
          ),
          Expanded(
              child: BaseForm(formFieldsList: [
            BaseTextFieldModel(title: 'Field 1'),
            BaseTextFieldModel(title: 'Field 2'),
            BaseImageFieldModel(
                imageUrl: 'new image', preFixImage: 'image prefix')
          ]))
        ],
      ),
    );
  }
}
