import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/back_button.dart';
import 'package:e_commerce/helpers/widgets/search_field.dart';
import 'package:e_commerce/screens/home/components/category/category_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/category-screen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          children: [
            30.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                const CustomBackButton(),
                5.verticalSpace,
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(onChanged: (val) {}),
                )),
              ],
            ),
            // const EmptyCategories(),
            // const InitialCategoryScreen(),
            const CategoryContent(),
          ],
        ),
      ),
    );
  }
}
