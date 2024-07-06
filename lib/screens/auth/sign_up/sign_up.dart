import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/helpers/widgets/back_button.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:get/get.dart';

import '../../../helpers/styles/app_decoration.dart';
import '../../../models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/widgets/custom_container.dart';
import '../../../helpers/widgets/input_field.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/sign-up';
  SignUp({super.key});

  final user = User();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.verticalSpace,
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CustomBackButton(),
                  ),
                  35.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Create Account',
                      style: AppDecoration.boldStyle(
                          fontSize: 35,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                  20.verticalSpace,
                  InputField(
                    validator: (val) => (val?.isEmpty == true)
                        ? 'First Name is required'
                        : null,
                    onChanged: (val) {
                      user.firstName = val;
                    },
                    hintText: 'Firstname',
                  ),
                  InputField(
                    onChanged: (val) {
                      user.lastName = val;
                    },
                    hintText: 'Lastname',
                  ),
                  InputField(
                    onChanged: (val) {
                      user.email = val;
                    },
                    validator: (val) =>
                        (val?.isEmpty == true) ? 'Email is required' : null,
                    hintText: 'Email Address',
                  ),
                  InputField(
                    onChanged: (val) {
                      user.password = val;
                    },
                    validator: (val) =>
                        (val?.isEmpty == true && (val?.length ?? 0) <= 8)
                            ? 'Password should be of at least 8 characters'
                            : null,
                    hintText: 'Password',
                    passwordField: true,
                  ),
                  10.verticalSpace,
                  InputField(
                    onChanged: (val) {
                      user.contactNumber = val;
                    },
                    hintText: 'Contact',
                  ),
                  10.verticalSpace,
                  CustomContainer(
                    height: 65,
                    width: 0.97.sw,
                    onTap: () {
                      if (controller.signUpValid) {
                        loadingWrapper(
                            () async => {await controller.signUp(user: user)});
                      }
                    },
                    text: 'Continue',
                    color: AppColors.lightPurple,
                    textColor: AppColors.pureWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
