import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/components/main_analytics.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/components/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ANALYTICS',
                  style: AppDecoration.boldStyle(
                      fontSize: 30, color: AppColors.black)),
              20.verticalSpace,
              Row(
                children: [
                  const MainAnalytics(),
                  10.horizontalSpace,
                  const TopSelling(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
