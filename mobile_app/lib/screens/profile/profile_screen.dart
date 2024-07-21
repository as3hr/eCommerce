import 'package:e_commerce/helpers/functions/dialog.dart';
import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:e_commerce/screens/profile/components/theme_switch.dart';

import '../../helpers/styles/app_decoration.dart';
import '../../helpers/widgets/custom_tile.dart';
import 'components/profile_option_list.dart';
import 'components/update_profile_screen.dart';
import 'profile_image.dart';
import 'profile_screen_controller.dart';
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
          final user = Get.find<AuthController>().user;
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Column(
                children: [
                  10.verticalSpace,
                  const ThemeSwitch(),
                  15.verticalSpace,
                  const ProfileImage(),
                  20.verticalSpace,
                  CustomTile(
                    height: 0.1.sh,
                    width: 0.9.sw,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${user.firstName ?? ''} ${user.lastName ?? ''}',
                        style: AppDecoration.mediumStyle(
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    subTitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        3.verticalSpace,
                        Text(
                          user.email ?? '',
                          style: AppDecoration.mediumStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                        5.verticalSpace,
                        Text(
                          user.contactNumber ?? '',
                          style: AppDecoration.mediumStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.onSecondary),
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
                    trailingOnTap: () {
                      changePage(UpdateProfileScreen.routeName);
                    },
                  ),
                  25.verticalSpace,
                  const ProfileOptionList(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(35),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          final response = await confirmationDialog(
                              title: 'Sign out',
                              message: 'Are you sure you want to sign Out?');
                          if (response) {
                            loadingWrapper(
                                () async => {
                                      await Get.find<AuthController>().logout()
                                    }).then((value) =>
                                showToast(message: 'Signed Out Successfully!'));
                          }
                        },
                        child: Text(
                          'Sign Out',
                          style: AppDecoration.semiBoldStyle(
                              fontSize: 23,
                              color: Theme.of(context).colorScheme.error),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
