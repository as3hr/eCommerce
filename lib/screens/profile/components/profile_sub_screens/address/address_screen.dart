import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/widgets/custom_tile.dart';
import 'package:e_commerce/helpers/widgets/header.dart';
import 'package:e_commerce/screens/profile/components/profile_sub_screens/address/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = '/address';
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          children: [
            35.verticalSpace,
            const Header(text: 'Address'),
            35.verticalSpace,
            CustomTile(
              width: 0.9.sw,
              title: Text(
                '2715 Ash Dr. San Jose',
                style: AppDecoration.semiBoldStyle(
                    fontSize: 18, color: AppColors.lightBlack),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                'Edit',
                style: AppDecoration.mediumStyle(
                    fontSize: 17, color: AppColors.lightPurple),
              ),
              trailingOnTap: () {
                changePage(AddAddressScreen.routeName);
              },
            ),
            CustomTile(
              width: 0.9.sw,
              title: Text(
                '2715 Ash Dr. San Jose',
                style: AppDecoration.semiBoldStyle(
                    fontSize: 18, color: AppColors.lightBlack),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                'Edit',
                style: AppDecoration.mediumStyle(
                    fontSize: 17, color: AppColors.lightPurple),
              ),
              trailingOnTap: () {
                changePage(AddAddressScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
