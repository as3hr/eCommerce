import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/widgets/custom_container.dart';
import '../../../helpers/widgets/input_field.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/sign-up';
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
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
                onChanged: (val) {},
                hintText: 'Firstname',
              ),
              InputField(
                onChanged: (val) {},
                hintText: 'Lastname',
              ),
              InputField(
                onChanged: (val) {},
                hintText: 'Email Address',
              ),
              InputField(
                onChanged: (val) {},
                hintText: 'Password',
              ),
              10.verticalSpace,
              CustomContainer(
                height: 65,
                width: 0.97.sw,
                onTap: () {
                  changePage(LoginScreen.routeName);
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
  }
}
