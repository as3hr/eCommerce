import 'package:ecommerce_admin_panel/helpers/functions/change_page.dart';
import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/custom_elevated_button.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/custom_table_design.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/models/address.dart';
import 'package:ecommerce_admin_panel/screens/users/user_controller.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/route_name.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      final user = controller.getCurrentUser;
      final address = (user.addresses?.isNotEmpty == true)
          ? user.addresses!.first
          : Address();
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(
                mainTitle: user.email ?? ' ',
                previousRoute: RouteName.userList,
                formTitle: 'User',
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 1.sw,
                  child: CustomTableDesign(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text('Basic Details',
                                style: GoogleFonts.inter(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: lightColorScheme.onSecondary,
                                )),
                            20.verticalSpace,
                            Text('Email', style: largeTextStyle),
                            3.verticalSpace,
                            Text(user.email ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('Full Name', style: largeTextStyle),
                            3.verticalSpace,
                            Text(user.firstName ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('User Name', style: largeTextStyle),
                            3.verticalSpace,
                            Text(user.userName ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('Contact Number', style: largeTextStyle),
                            3.verticalSpace,
                            Text(user.contactNumber ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 1.sw,
                  child: CustomTableDesign(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text('User History',
                                style: GoogleFonts.inter(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: lightColorScheme.onSecondary,
                                )),
                            20.verticalSpace,
                            Text('Total Orders', style: largeTextStyle),
                            3.verticalSpace,
                            const Text('0',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('Total Payments', style: largeTextStyle),
                            3.verticalSpace,
                            const Text('0',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('Favourite Products', style: largeTextStyle),
                            3.verticalSpace,
                            const Text('0',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('Street Address', style: largeTextStyle),
                            3.verticalSpace,
                            Text(address.streetAddress ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('City', style: largeTextStyle),
                            3.verticalSpace,
                            Text(address.city ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('State', style: largeTextStyle),
                            3.verticalSpace,
                            Text(address.state ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                            Text('Zip Code', style: largeTextStyle),
                            3.verticalSpace,
                            Text(address.city ?? '-',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                            10.verticalSpace,
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 1.sw,
                  child: CustomTableDesign(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text('Delete Management',
                                style: GoogleFonts.inter(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: lightColorScheme.onSecondary,
                                )),
                            5.verticalSpace,
                            CustomElevatedButton(
                              onPressed: () async {
                                await loadingWrapper(() async {
                                  await controller.deleteUser();
                                }, context)
                                    .then((_) => changePage(
                                        context, RouteName.userList));
                              },
                              width: 120,
                              text: 'Delete Account',
                              textColor: Colors.red,
                              color: Colors.white,
                              borderColor: Colors.red,
                            ),
                            10.verticalSpace,
                            const Text(
                                'Remove this customer’s chart if he requested that, if not please be aware that what has been deleted can never brought back.',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                )),
                          ]),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
            ],
          ),
        ),
      );
    });
  }
}
