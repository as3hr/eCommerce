import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/widgets/custom_container.dart';
import '../../../helpers/widgets/header.dart';
import '../../../helpers/widgets/input_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const routeName = '/update-profile';
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      final user = controller.user;
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
            child: Column(
          children: [
            35.verticalSpace,
            const Header(text: 'Update Profile'),
            35.verticalSpace,
            InputField(
              preFilledValue: user.firstName ?? '',
              onChanged: (val) {
                user.firstName = val;
              },
              hintText: 'Firstname',
            ),
            InputField(
              preFilledValue: user.lastName ?? '',
              onChanged: (val) {
                user.lastName = val;
              },
              hintText: 'Lastname',
            ),
            InputField(
              preFilledValue: user.email ?? '',
              onChanged: (val) {
                user.email = val;
              },
              hintText: 'Email Address',
            ),
            InputField(
              preFilledValue: user.contactNumber ?? '',
              onChanged: (val) {
                user.contactNumber = val;
              },
              hintText: 'Contact',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                  onTap: () {
                    loadingWrapper(
                        () async => {await controller.updateUser(user: user)});
                  },
                  text: 'Save',
                  color: AppColors.lightPurple,
                  textColor: AppColors.pureWhite),
            ),
          ],
        )),
      );
    });
  }
}
