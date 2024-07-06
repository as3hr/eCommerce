import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'initial_category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/category-screen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              30.verticalSpace,
              const InitialCategoryScreen(),
            ],
          ),
        ),
      );
    });
  }
}
