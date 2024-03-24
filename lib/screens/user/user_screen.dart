import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/screens/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/widgets/form/base_form.dart';
import '../../helpers/widgets/form/form_fields.dart';
import '../../routes/route_name.dart';
import '../../theme.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Get.put(UserController());
    controller.getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserController(),
        builder: (controller) {
          final user = controller.getCurrentUser;
          final isNew = user.id?.isEmpty ?? true;
          return Scaffold(
            backgroundColor: lightColorScheme.onBackground,
            body: Column(
              children: [
                CustomHeader(
                  previousRoute: RouteName.userList,
                  formTitle: 'User',
                  onPressed: () {},
                ),
                Expanded(
                    child: BaseForm(
                        isNew: isNew,
                        deletefunction: () async {
                          await controller.deleteUser().then(
                              (value) => context.goNamed(RouteName.userList));
                        },
                        formFieldsList: [
                      BaseTextFieldModel(
                        title: 'User Name',
                        prefixText: user.userName ?? '',
                        onSelected: (val) {
                          user.userName = val;
                        },
                      ),
                      BaseTextFieldModel(
                        title: 'Contact Number',
                        prefixText: user.contactNumber ?? '',
                        onSelected: (val) {
                          user.contactNumber = val;
                        },
                      ),
                      BaseTextFieldModel(
                        title: 'Email',
                        prefixText: user.email ?? '',
                        onSelected: (val) {
                          user.email = val;
                        },
                      ),
                      BaseTextFieldModel(
                        title: 'Last Name',
                        prefixText: user.lastName ?? '',
                        onSelected: (val) {
                          user.lastName = val;
                        },
                      ),
                    ]))
              ],
            ),
          );
        });
  }
}
