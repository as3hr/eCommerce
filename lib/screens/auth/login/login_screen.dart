import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:get/get.dart';

import '../../../helpers/functions/change_page.dart';
import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_images.dart';
import '../../../helpers/widgets/custom_container.dart';
import '../../../helpers/widgets/input_field.dart';
import '../sign_up/sign_up.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_decoration.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    80.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Sign in',
                        style: AppDecoration.boldStyle(
                            fontSize: 35,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    10.verticalSpace,
                    InputField(
                      onChanged: (val) {
                        controller.email = val;
                      },
                      validator: (val) =>
                          (val?.isEmpty == true) ? 'Email is required' : null,
                      hintText: 'Email Address',
                    ),
                    InputField(
                      onChanged: (val) {
                        controller.password = val;
                      },
                      passwordField: true,
                      hintText: 'Password',
                      validator: (val) => (val?.isEmpty == true)
                          ? 'Enter a valid password!'
                          : null,
                    ),
                    10.verticalSpace,
                    CustomContainer(
                      height: 65,
                      width: 0.97.sw,
                      onTap: () {
                        if (controller.loginValid) {
                          loadingWrapper(() async {
                            await controller.login();
                          });
                        }
                      },
                      text: 'Continue',
                      color: AppColors.lightPurple,
                      textColor: AppColors.pureWhite,
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          changePage(SignUp.routeName);
                        },
                        child: EasyRichText(
                          "Don't have an Account ? Create One",
                          defaultStyle: AppDecoration.mediumStyle(
                              fontSize: 14,
                              color: context.isDark
                                  ? AppColors.grayIII
                                  : AppColors.lightBlack),
                          patternList: [
                            EasyPattern(
                                targetString: 'Create One',
                                style: AppDecoration.boldStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary))
                          ],
                        ),
                      ),
                    ),
                    60.verticalSpace,
                    CustomContainer(
                      height: 65,
                      width: 0.97.sw,
                      onTap: () {
                        loadingWrapper(() async {
                          await controller.googleSignIn();
                        }, showLogs: true);
                      },
                      preFixImage: AppImages.google,
                      text: 'Continue With Google',
                      color: Theme.of(context).colorScheme.onPrimary,
                      textColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
