import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/input_field.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../helpers/styles/app_colors.dart';

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
            backgroundColor: AppColors.navy,
            body: Form(
              key: controller.formKey,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 0.25.sw,
                  height: 0.5.sh,
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        30.verticalSpace,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Sign In',
                                style: AppDecoration.boldStyle(
                                    fontSize: 26, color: AppColors.deepBlack),
                              ),
                            )),
                        30.verticalSpace,
                        InputField(
                          width: 0.3.sw,
                          onChanged: (val) {
                            controller.emailController.text = val;
                          },
                          onSubmit: (_) {
                            loadingWrapper(() async {
                              await controller.submit(context);
                            }, context);
                          },
                          hintText: 'Email',
                          preFixIcon: const Icon(Icons.mail_rounded,
                              color: AppColors.navy),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        InputField(
                          width: 0.3.sw,
                          onChanged: (val) {
                            controller.passwordController.text = val;
                          },
                          onSubmit: (_) {
                            loadingWrapper(() async {
                              await controller.submit(context);
                            }, context);
                          },
                          preFixIcon:
                              const Icon(Icons.lock, color: AppColors.navy),
                          hintText: 'Password',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          passwordField: true,
                        ),
                        30.verticalSpace,
                        InkWell(
                          onTap: () {
                            loadingWrapper(() async {
                              await controller.submit(context);
                            }, context);
                          },
                          child: Container(
                            width: 0.15.sw,
                            height: 0.05.sh,
                            decoration: BoxDecoration(
                                color: AppColors.navy,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: AppDecoration.boldStyle(
                                    fontSize: 20, color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
