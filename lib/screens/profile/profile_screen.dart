import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/widgets/custom_tile.dart';
import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/profile/components/profile_option_list.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/functions/change_page.dart';
import '../../helpers/styles/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.pureWhite,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    55.verticalSpace,
                    const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.grayI,
                      ),
                    ),
                    20.verticalSpace,
                    CustomTile(
                      height: 0.1.sh,
                      width: 0.9.sw,
                      title: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Gilbert Jones',
                          style: AppDecoration.mediumStyle(
                              fontSize: 17, color: AppColors.pureBlack),
                        ),
                      ),
                      subTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          3.verticalSpace,
                          Text(
                            'GIlbertjones@gmail.com',
                            style: AppDecoration.mediumStyle(
                                fontSize: 16, color: AppColors.pureBlack),
                          ),
                          5.verticalSpace,
                          Text(
                            '+92 3323232456',
                            style: AppDecoration.mediumStyle(
                                fontSize: 15, color: AppColors.pureBlack),
                          ),
                        ],
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Text(
                          'Edit',
                          style: AppDecoration.mediumStyle(
                              fontSize: 17, color: AppColors.lightPurple),
                        ),
                      ),
                    ),
                    25.verticalSpace,
                    const ProfileOptionList(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          changePage(LoginScreen.routeName, signOut: true);
                        },
                        child: Text(
                          'Sign Out',
                          style: AppDecoration.semiBoldStyle(
                              fontSize: 23, color: AppColors.redColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
