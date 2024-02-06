import 'package:e_commerce/helpers/widgets/custom_tile.dart';
import 'package:e_commerce/screens/profile/components/profile_option_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/styles/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text('Gilbert Jones'),
                ),
                subTitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    3.verticalSpace,
                    const Text('GIlbertjones@gmail.com'),
                    5.verticalSpace,
                    const Text('+92 3323232456'),
                  ],
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Text('Edit'),
                ),
              ),
              25.verticalSpace,
              const ProfileOptionList(),
              const Center(
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
