import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/search_field.dart';
import 'package:e_commerce/screens/home/components/category/all_categories.dart';
import 'package:e_commerce/screens/home/components/category/categories_screen.dart';
import 'package:e_commerce/screens/home/components/home_header/home_header.dart';
import 'package:e_commerce/helpers/widgets/spacer_row.dart';
import 'package:e_commerce/screens/home/components/items_list.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.pureWhite,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    25.verticalSpace,
                    const HomeHeader(),
                    15.verticalSpace,
                    SearchField(onChanged: (val) {}),
                    15.verticalSpace,
                    SpacerRow(
                      text1: 'Categories',
                      text2: 'See All',
                      text2Tap: () {
                        changePage(CategoriesScreen.routeName);
                      },
                    ),
                    15.verticalSpace,
                    const AllCategories(),
                    15.verticalSpace,
                    const SpacerRow(text1: 'Top Selling', text2: 'See All'),
                    15.verticalSpace,
                    const ItemsList(),
                    15.verticalSpace,
                    const SpacerRow(text1: 'New in', text2: 'See All'),
                    15.verticalSpace,
                    const ItemsList(),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
