import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/input_field.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../helpers/styles/app_colors.dart';
import '../../helpers/styles/asset_images.dart';

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
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.3.sw,
                  child: ListTile(
                    leading: Image.asset(
                      AssetImages.logo,
                      scale: 0.0001,
                    ),
                    title: Text(
                      'C L O T   A D M I N   P A N E L',
                      style: AppDecoration.boldStyle(
                          fontSize: 25, color: AppColors.grayI),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.white,
                  width: 3,
                  height: 0.7.sh,
                ),
                55.horizontalSpace,
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      30.verticalSpace,
                      const Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      const Text(
                        'Please Login to Admin Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      30.verticalSpace,
                      InputField(
                        width: 0.2.sw,
                        onChanged: (val) {
                          controller.emailController.text = val;
                        },
                        onSubmit: (_) {
                          loadingWrapper(() async {
                            await controller.submit(context);
                          }, context);
                        },
                        hintText: 'Email',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      InputField(
                        width: 0.2.sw,
                        onChanged: (val) {
                          controller.passwordController.text = val;
                        },
                        onSubmit: (_) {
                          loadingWrapper(() async {
                            await controller.submit(context);
                          }, context);
                        },
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
                              color: AppColors.skyBlue,
                              borderRadius: BorderRadius.circular(10)),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
