import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/widgets/custom_container.dart';
import '../../../helpers/widgets/header.dart';
import '../../../helpers/widgets/input_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const routeName = '/update-profile';
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
          child: Column(
        children: [
          35.verticalSpace,
          const Header(text: 'Update Profile'),
          35.verticalSpace,
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
            hintText: 'Contact',
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomContainer(
                onTap: () {},
                text: 'Save',
                color: AppColors.lightPurple,
                textColor: AppColors.pureWhite),
          ),
        ],
      )),
    );
  }
}
