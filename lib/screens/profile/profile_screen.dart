import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Account'),
            ),
            20.verticalSpace,
            const Divider(color: AppColors.offWhite, thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.navy,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      20.horizontalSpace,
                      const Text('Change'),
                    ],
                  ),
                  const BaseTextField(
                    title: 'First Name',
                  ),
                  const BaseTextField(
                    title: 'Last Name',
                  ),
                  const BaseTextField(
                    title: 'Phone Number',
                  ),
                  const BaseTextField(
                    title: 'Email',
                  ),
                  const ExpansionTile(
                    title: Text('Change Password'),
                    children: [
                      BaseTextField(
                        title: 'Old Password',
                      ),
                      BaseTextField(
                        title: 'New Password',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
