import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../helpers/extensions/theme_colors.dart';
import '../../theme.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Material(
          child: Scaffold(
            backgroundColor: ThemeColors.grayBackground,
            body: Form(
              key: controller.formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: 430,
                        child: Center(
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: fieldDecoration(label: 'Admin ID'),
                            controller: controller.emailController,
                            onEditingComplete: () {
                              Focus.of(context).nextFocus();
                            },
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: 430,
                        child: Center(
                          child: TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            controller: controller.passwordController,
                            decoration: fieldDecoration(
                              label: 'Password',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await controller.submit().then((value) =>
                                          context.goNamed(RouteName.home));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.8),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onEditingComplete: () async {
                              await controller.submit().then(
                                  (value) => context.goNamed(RouteName.home));
                            },
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
