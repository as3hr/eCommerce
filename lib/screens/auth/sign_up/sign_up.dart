import 'package:e_commerce/helpers/functions/loader.dart';
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
        backgroundColor: AppColors.pureWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Create Account',
                    style: AppDecoration.boldStyle(
                        fontSize: 35, color: AppColors.pureBlack),
                  ),
                ),
                20.verticalSpace,
                InputField(
                  onChanged: (val) {
                    user.firstName = val;
                  },
                  hintText: 'Firstname',
                ),
                InputField(
                  onChanged: (val) {
                    user.lastName = val;
                  },
                  validator: (val) =>
                      (val?.isEmpty == true) ? 'Enter a valid password!' : null,
                  hintText: 'Lastname',
                ),
                InputField(
                  onChanged: (val) {
                    user.email = val;
                  },
                  hintText: 'Email Address',
                ),
                InputField(
                  onChanged: (val) {
                    user.password = val;
                  },
                  hintText: 'Password',
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
                    loadingWrapper(
                        () async => {await controller.signUp(user: user)});
                  },
                  text: 'Continue',
                  color: AppColors.lightPurple,
                  textColor: AppColors.pureWhite,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
