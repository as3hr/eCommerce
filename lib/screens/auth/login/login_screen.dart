import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/custom_container.dart';
import 'package:e_commerce/helpers/widgets/input_field.dart';
import 'package:e_commerce/screens/auth/sign_up/sign_up.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.pureWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                80.verticalSpace,
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                10.verticalSpace,
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
                  onTap: () {
                    changePage(SignUp.routeName);
                  },
                  text: 'Continue',
                  color: AppColors.lightPurple,
                  textColor: AppColors.pureWhite,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: EasyRichText(
                    "Don't have an Account ? Create One",
                    patternList: [
                      EasyPattern(
                          targetString: 'Create One',
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                60.verticalSpace,
                CustomContainer(
                  onTap: () {},
                  preFixIcon: Icons.apple,
                  text: 'Continue With Apple',
                  color: AppColors.grayI,
                  textColor: AppColors.pureBlack,
                ),
                CustomContainer(
                  onTap: () {},
                  preFixIcon: Icons.g_mobiledata_outlined,
                  text: 'Continue With Google',
                  color: AppColors.grayI,
                  textColor: AppColors.pureBlack,
                ),
                CustomContainer(
                  onTap: () {},
                  preFixIcon: Icons.facebook,
                  text: 'Continue With Facebook',
                  color: AppColors.grayI,
                  textColor: AppColors.pureBlack,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
