import 'package:e_commerce/helpers/widgets/indicator.dart';

import '../../helpers/functions/change_page.dart';
import '../../helpers/styles/app_decoration.dart';
import '../../helpers/widgets/search_field.dart';
import 'components/category/all_categories.dart';
import 'components/category/categories_screen.dart';
import 'components/home_header/home_header.dart';
import '../../helpers/widgets/spacer_row.dart';
import 'components/items_list.dart';
import 'home_screen_controller.dart';
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
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: !controller.fetchedData
                ? const Indicator()
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          25.verticalSpace,
                          const HomeHeader(),
                          15.verticalSpace,
                          SearchField(onChanged: (val) {
                            controller.title.value = val;
                            controller.searchProducts();
                          }),
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
                          controller.productsList.isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'No Items to Display!!',
                                      style: AppDecoration.mediumStyle(
                                          fontSize: 25,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    const SpacerRow(text1: 'Top Selling'),
                                    15.verticalSpace,
                                    const ItemsList(),
                                    15.verticalSpace,
                                    const SpacerRow(text1: 'New in'),
                                    15.verticalSpace,
                                    const ItemsList(reverse: true),
                                    10.verticalSpace,
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
